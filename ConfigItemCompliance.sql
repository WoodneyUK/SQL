SELECT 
vrs.Name0,
vrs.User_Name0,
vCISummary.CIVersion,
--vCISummary.IsApplicable,
--vCISummary.IsDetected,
--vCISummary.DesiredState,
(CASE vCISummary.ComplianceState
	WHEN 2 THEN vCIDetail.CurrentValue
	WHEN 1 THEN 'Compliant'
	--ELSE 'Failed'
END) As 'ComplianceDetail',
vCISummary.LastComplianceMessageTime

FROM [CM_UKP_PROD].[dbo].[v_CICurrentComplianceStatus] vCISummary
LEFT JOIN v_CIComplianceStatusDetail as vCIDetail on vCIDetail.resourceid = vCISummary.ResourceID
AND vCIDetail.ci_id = vCISummary.CI_ID
JOIN v_r_system as VRS on VRS.ResourceID = vCISummary.ResourceID
where vCISummary.ci_id = '17759575'

Order by vCISummary.ComplianceState DESC
