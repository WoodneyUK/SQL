Declare @ArticleID varchar(10) = '452201%'

select ucs.ci_id, ucs.status,
case when ucs.status=3 then 'installed'
when ucs.status=2 then 'required/missing'
else 'other'
end as 'result',
ui.title, ui.articleid
,count(distinct fcm.resourceid) [Count]
from v_updateComplianceStatus ucs
join v_updateinfo ui on ui.ci_id=ucs.ci_id
join v_FullCollectionMembership fcm on fcm.resourceid=ucs.resourceid
where ui.ArticleID like @ArticleID
--and fcm.collectionid='ThatSpecificcollectionIDYouWantedToLookAt'
--and ucs.status=3 --well, you could leave this out; to get all status'
group by ucs.ci_id, ucs.status, ui.title, ui.articleid
order by ucs.ci_id
