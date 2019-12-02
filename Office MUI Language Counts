SELECT vrs.Name0
      ,Operating_System_DATA.MUILanguages00
	  ,sum(len(Operating_System_DATA.MUILanguages00) - len(replace(Operating_System_DATA.MUILanguages00, ',', '')) + 1) as 'MUILanguageCount'
	  ,Operating_System_DATA.Caption00
  FROM Operating_System_DATA
  join V_r_system VRS on VRS.ResourceID = Operating_System_DATA.machineID
  where name0 not like 'LDS-V%'
  
  group by vrs.name0, Operating_System_DATA.MUILanguages00, Operating_System_DATA.Caption00
  having (sum(len(Operating_System_DATA.MUILanguages00) - len(replace(Operating_System_DATA.MUILanguages00, ',', '')) + 1) > 1)
