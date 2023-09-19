# Name of the rule in EventBridge
rule_name="every_minute"

# Total execution duration in seconds (1 minutes)
duration=60

# Enable the rule in EventBridge
aws events enable-rule --name "$rule_name"

# Wait for the specified duration before disabling the rule
sleep "$duration"

# Disable the rule in EventBridge
aws events disable-rule --name "$rule_name"