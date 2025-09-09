# Smart Automation Setup Instructions

## Prerequisites

Before you begin, make sure you have:

- **Docker Desktop** installed and running
- **Git** for version control
- A **web browser** for testing
- **Text editor** for customization (VS Code recommended)

## Quick Setup (5 minutes)

### Step 1: Clone the Repository

```bash
git clone <your-repo-url>
cd smart-automation
```

### Step 2: Run the Setup Script

```bash
chmod +x setup.sh
./setup.sh
```

This script will:
- Start n8n with Docker
- Create necessary directories
- Import preconfigured workflows
- Provide next steps

### Step 3: Access Your Applications

- **n8n Dashboard**: http://localhost:5678
- **Landing Page**: Start a web server (see below)

### Step 4: Start the Landing Page

Choose your preferred method:

```bash
# Option 1: Python (most common)
python -m http.server 8000

# Option 2: Node.js (if installed)
npx serve .

# Option 3: PHP (if installed)
php -S localhost:8000

# Option 4: Live Server (VS Code extension)
# Right-click index.html → "Open with Live Server"
```

Then open: http://localhost:8000

## Configuration

### 1. Email Setup (Required for production)

1. **Choose an Email Provider**:
   - Gmail (easiest for testing)
   - SendGrid (recommended for production)
   - Mailgun, AWS SES, etc.

2. **Gmail Setup** (for testing):
   - Enable 2-factor authentication
   - Generate an app password: https://support.google.com/accounts/answer/185833
   - Use the app password in n8n email nodes

3. **Update n8n Workflows**:
   - Open n8n dashboard: http://localhost:5678
   - Go to each workflow
   - Update email node credentials
   - Save and activate workflows

### 2. Customize Your Landing Page

1. **Update Branding**:
   ```css
   /* In styles.css, update these variables */
   :root {
     --primary-color: #your-brand-color;
     --secondary-color: #your-accent-color;
   }
   ```

2. **Update Content**:
   - Edit `index.html` for text, images, and messaging
   - Replace company name and contact information
   - Add your logo and imagery

3. **Update Contact Information**:
   - In `.env` file, set your admin email
   - Update company details in email templates

### 3. Production Deployment

1. **Secure n8n**:
   ```bash
   # Update .env file
   N8N_BASIC_AUTH_ACTIVE=true
   N8N_BASIC_AUTH_USER=admin
   N8N_BASIC_AUTH_PASSWORD=your_secure_password
   ```

2. **Use PostgreSQL** (recommended for production):
   ```bash
   docker-compose --profile production up -d
   ```

3. **Deploy to a Server**:
   - Upload files to your VPS/cloud server
   - Configure domain and SSL
   - Set up reverse proxy (nginx recommended)

## Testing Your Setup

### 1. Test the Contact Form

1. Open your landing page
2. Fill out the contact form
3. Submit the form
4. Check n8n executions for successful processing

### 2. Test Email Workflows

1. Go to n8n dashboard
2. Manually trigger the "Contact Form Handler" workflow
3. Verify emails are sent successfully
4. Check execution logs for any errors

### 3. Test Mobile Responsiveness

- Test on various screen sizes
- Use browser dev tools to simulate mobile devices
- Verify all functionality works on mobile

## Common Issues & Solutions

### n8n Won't Start

```bash
# Check if port 5678 is in use
lsof -i :5678

# Restart Docker services
docker-compose restart

# Check logs
docker-compose logs n8n
```

### Form Submissions Not Working

1. Verify n8n is running: http://localhost:5678
2. Check webhook URL in `script.js`
3. Look for JavaScript errors in browser console
4. Verify CORS settings in n8n

### Emails Not Sending

1. Check SMTP credentials in n8n
2. Verify email node configuration
3. Test with a simple email first
4. Check spam folders

### Styling Issues

1. Clear browser cache
2. Check CSS file paths
3. Verify font and icon CDN links
4. Test in incognito mode

## Next Steps

1. **Import Workflows**:
   - Go to n8n dashboard
   - Import `n8n/workflows/*.json` files
   - Configure email credentials
   - Activate workflows

2. **Customize for Your Business**:
   - Update colors, fonts, and branding
   - Modify form fields as needed
   - Add analytics tracking
   - Set up domain and hosting

3. **Add More Automation**:
   - CRM integration
   - Slack notifications
   - Database storage
   - Advanced email sequences

## Support

If you run into issues:

1. Check this guide first
2. Review n8n documentation: https://docs.n8n.io
3. Check Docker logs: `docker-compose logs`
4. Open an issue in the repository

## Security Notes

- Always use strong passwords in production
- Enable basic authentication for n8n
- Use HTTPS in production
- Regularly update Docker images
- Backup your workflows and data

---

🎉 **You're all set!** Your smart automation system is ready to capture leads and grow your business.