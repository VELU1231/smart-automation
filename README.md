# Smart Automation - Landing Page with n8n Integration

A client-ready website template with built-in automation workflows powered by n8n. Perfect for businesses looking to capture leads, automate follow-ups, and grow smarter.

## 🚀 Features

- **Responsive Landing Page**: Modern, mobile-first design that looks great on all devices
- **Contact Form Integration**: Seamlessly connects to n8n workflows for instant lead processing
- **Docker Setup**: One-command deployment with preconfigured n8n workflows
- **Email Automation**: Automatic thank-you emails and follow-up sequences
- **Lead Management**: Organized lead capture with automated database storage
- **Client-Ready**: Professional design suitable for immediate client deployment

## 📋 Quick Start

### Prerequisites

- Docker and Docker Compose installed
- Basic knowledge of HTML/CSS/JavaScript (for customization)

### 1. Clone and Setup

```bash
git clone <your-repo-url>
cd smart-automation
```

### 2. Start n8n with Docker

```bash
# Start n8n and supporting services
docker compose up -d

# Check if n8n is running
docker compose ps
```

### 3. Access n8n Dashboard

Open your browser and go to: `http://localhost:5678`

- No authentication required in development mode
- Pre-configured workflows will be available

### 4. Serve the Landing Page

For development, you can use any local server:

```bash
# Using Python 3
python -m http.server 8000

# Using Node.js (if you have it)
npx serve .

# Using PHP
php -S localhost:8000
```

Then open: `http://localhost:8000`

## 🔧 Configuration

### Environment Variables

Create a `.env` file for production:

```env
# n8n Configuration
N8N_BASIC_AUTH_ACTIVE=true
N8N_BASIC_AUTH_USER=admin
N8N_BASIC_AUTH_PASSWORD=your_secure_password

# Email Configuration (update in n8n workflows)
SMTP_HOST=smtp.gmail.com
SMTP_PORT=587
SMTP_USER=your-email@gmail.com
SMTP_PASS=your-app-password

# Database (for production)
DB_TYPE=postgresdb
DB_POSTGRESDB_HOST=postgres
DB_POSTGRESDB_PORT=5432
DB_POSTGRESDB_DATABASE=n8n
DB_POSTGRESDB_USER=n8n
DB_POSTGRESDB_PASSWORD=n8n_password_2024
```

### Customizing the Landing Page

1. **Branding**: Update colors, fonts, and logos in `styles.css`
2. **Content**: Modify text, images, and messaging in `index.html`
3. **Form Fields**: Add/remove form fields in both HTML and the n8n workflow
4. **Webhook URL**: Update the webhook URL in `script.js` if deploying to a different domain

### Email Setup

1. **Gmail Setup** (Recommended for testing):
   - Enable 2-factor authentication
   - Generate an app password
   - Use the app password in n8n email nodes

2. **Other SMTP Providers**:
   - Update SMTP settings in the n8n workflow email nodes
   - Supported: SendGrid, Mailgun, AWS SES, etc.

## 📊 Included Workflows

### 1. Contact Form Handler (`contact-form-handler.json`)

- **Trigger**: Webhook on `/webhook/contact-form`
- **Process**: Validates email, saves to database, sends notifications
- **Response**: JSON response with success/error status

### 2. Lead Nurturing Sequence (`lead-nurturing-sequence.json`)

- **Trigger**: Daily at 9 AM
- **Process**: Finds new leads and sends follow-up emails
- **Features**: Automated email sequences, lead tracking

## 🌐 Deployment

### Development Deployment

```bash
# Start all services
docker compose up -d

# View logs
docker compose logs -f n8n
```

### Production Deployment

1. **Update docker-compose.yml**:
   ```bash
   # Use production profile
   docker compose --profile production up -d
   ```

2. **Configure Domain**:
   - Update `N8N_HOST` environment variable
   - Set up reverse proxy (nginx recommended)
   - Configure SSL certificates

3. **Security**:
   - Enable basic authentication
   - Use strong passwords
   - Restrict database access
   - Set up firewall rules

### Hosting Options

- **VPS**: DigitalOcean, Linode, AWS EC2
- **Container Services**: AWS ECS, Google Cloud Run
- **Platform as a Service**: Railway, Render, Heroku

## 🛠️ Customization Guide

### Adding New Form Fields

1. Add field to `index.html`:
   ```html
   <div class="form__group">
       <label for="budget" class="form__label">Budget Range</label>
       <select id="budget" name="budget" class="form__input">
           <option value="">Select budget range</option>
           <option value="<5k">Less than $5,000</option>
           <option value="5k-10k">$5,000 - $10,000</option>
           <option value=">10k">More than $10,000</option>
       </select>
   </div>
   ```

2. Update the n8n workflow to handle the new field

3. Modify email templates to include the new data

### Styling Customization

Update CSS variables in `styles.css`:

```css
:root {
    --primary-color: #your-brand-color;
    --secondary-color: #your-secondary-color;
    /* ... other variables */
}
```

### Analytics Integration

Add Google Analytics or other tracking:

```html
<!-- Add to <head> in index.html -->
<script async src="https://www.googletagmanager.com/gtag/js?id=GA_MEASUREMENT_ID"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());
  gtag('config', 'GA_MEASUREMENT_ID');
</script>
```

## 🔍 Troubleshooting

### Common Issues

1. **n8n not starting**:
   ```bash
   # Check logs
   docker compose logs n8n
   
   # Restart service
   docker compose restart n8n
   ```

2. **Form submissions not working**:
   - Check if n8n is running: `http://localhost:5678`
   - Verify webhook URL in `script.js`
   - Check browser console for errors

3. **Emails not sending**:
   - Verify SMTP credentials in n8n
   - Check n8n execution logs
   - Test email configuration

### Development Tools

- **Mailhog** (included): Test emails locally at `http://localhost:8025`
- **Redis** (optional): Improves n8n performance
- **PostgreSQL** (production): Better than SQLite for production

## 📝 License

This project is open source and available under the [MIT License](LICENSE).

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Test thoroughly
5. Submit a pull request

## 📞 Support

For questions or issues:

1. Check the troubleshooting section
2. Review n8n documentation: https://docs.n8n.io
3. Open an issue in this repository

## 🎯 Next Steps

- [ ] Set up your email provider
- [ ] Customize branding and content
- [ ] Test the complete workflow
- [ ] Deploy to production
- [ ] Set up monitoring and analytics

---

**Built with ❤️ for businesses ready to automate and grow smarter.**
