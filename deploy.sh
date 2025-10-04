#!/bin/bash
# === GitHub Pages Auto Deployment Script ===

# Navigate to your GitHub repo
cd ~/Desktop/my-website || exit

# Copy your HTML file from Desktop into the repo
cp ~/Desktop/market_report.html .

# Stage all changes
git add .

# Commit changes with timestamp
git commit -m "Auto update $(date +'%Y-%m-%d %H:%M:%S')" || echo "No changes to commit."

# Push changes to GitHub (SSH)
git push origin main

# Optional log for cron
echo "Deployed at $(date)" >> ~/Desktop/deploy.log
