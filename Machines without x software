Select Distinct
 sys.Netbios_Name0,
 sys.User_Name0,
 lin.LLMCUVersion00
FROM v_R_System sys
JOIN v_Add_Remove_Programs arp ON sys.ResourceID = arp.ResourceID
left join REGISTRY_SOFTWARELINKLATERS_CUSTOM_DATA lin on lin.MachineID = sys.ResourceID
WHERE
 sys.ResourceID not in
 (select sys.ResourceID
 from
 v_R_System sys
 JOIN v_Add_Remove_Programs arp ON sys.ResourceID = arp.ResourceID
 WHERE
 DisplayName0 = 'Cisco jabber' and version0 >= '12.6.1')
 and sys.Operating_System_Name_and0 like '%workstation%'
