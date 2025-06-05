#!/bin/bash
apt-get update -y
apt-get install -y nginx
#!/bin/bash
# Install nginx if not already installed
if ! command -v nginx &> /dev/null; then
  apt-get update
  apt-get install -y nginx
fi

# Create nginx configuration
if [ ! -f /etc/nginx/sites-available/default.bak ]; then
  cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
fi

# Make sure our scripts are executable
chmod +x $(dirname "$0")/*.sh

# Rest of your script...
# Configure nginx site
cat > /etc/nginx/sites-available/default << 'EOF'
server {
    listen 80 default_server;    // filepath: c:\DATA\J\blue green deployment\scripts\install_nginx.sh
    #!/bin/bash
    # Install nginx if not already installed
    if ! command -v nginx &> /dev/null; then
      apt-get update
      apt-get install -y nginx
    fi
    
    # Create nginx configuration
    if [ ! -f /etc/nginx/sites-available/default.bak ]; then
      cp /etc/nginx/sites-available/default /etc/nginx/sites-available/default.bak
    fi
    
    # Configure nginx site
    cat > /etc/nginx/sites-available/default << 'EOF'
    server {
        listen 80 default_server;
        listen [::]:80 default_server;
        root /var/www/html;
        index index.html index.htm;
        server_name _;
        location / {
            try_files $uri $uri/ =404;
        }
    }
    EOF
    listen [::]:80 default_server;
    root /var/www/html;
    index index.html index.htm;
    server_name _;
    location / {
        try_files $uri $uri/ =404;
    }
}
EOF
