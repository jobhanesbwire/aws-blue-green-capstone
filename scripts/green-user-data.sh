#!/bin/bash
set -euo pipefail

LOG_FILE="/var/log/green-user-data.log"
mkdir -p /var/log
exec > >(tee -a "$LOG_FILE") 2>&1

echo "Starting Green user data script"

dnf update -y

dnf install -y httpd

systemctl enable httpd
systemctl start httpd

cat > /var/www/html/index.html <<'EOF'
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0" />
  <title>Green Environment</title>
  <style>
    body { font-family: Arial, sans-serif; background: #f4fff0; color: #153; padding: 2rem; }
    .box { background: #ffffff; border: 1px solid #2e8b57; border-radius: 8px; padding: 1.5rem; max-width: 700px; }
    h1 { color: #2e8b57; }
  </style>
</head>
<body>
  <div class="box">
    <h1>GREEN ENVIRONMENT</h1>
    <p><strong>Version 2</strong></p>
    <p><strong>Candidate Release</strong></p>
    <p><strong>Region:</strong> eu-west-1</p>
    <p>Deployment timestamp: $(date -u '+%Y-%m-%d %H:%M:%S UTC')</p>
    <p>This page represents the candidate release for the blue/green deployment capstone.</p>
  </div>
</body>
</html>
EOF

cat > /var/www/html/health <<'EOF'
OK
EOF

systemctl reload httpd

echo "Green user data script completed successfully"
