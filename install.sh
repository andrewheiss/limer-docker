#!/usr/bin/env bash
# Make a copy of the default MySQL configuration
cp /app/application/config/config-sample-mysql.php /app/application/config/config.php

# Enable RPC API
sed -i "s/'config'=>array(/&\n\t'RPCInterface'=>'json',/" /app/application/config/config.php

# Install LimeSurvey with the CLI
cd /app/application/commands/; php console.php install limer limerpassword Testing testing@example.com
