input='ip_list.txt'
firewall_rules=''
while IFS= read -r line
do
    firewall_rules=`echo -e "${firewall_rules}\\n      - type: firewall-rules\\n        include:\\n          - ${line}\\n"`
done < "${input}"

eval "echo \"$(cat firewall_policy_template.yml)\""
