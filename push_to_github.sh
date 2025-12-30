#!/bin/bash
# Script to push to GitHub using Personal Access Token

echo "لرفع التغييرات على GitHub، تحتاج إلى Personal Access Token"
echo ""
echo "إذا كان لديك token، أدخله الآن:"
read -s GITHUB_TOKEN

if [ -z "$GITHUB_TOKEN" ]; then
    echo "لم يتم إدخال token. إلغاء العملية."
    exit 1
fi

# Set remote URL with token
git remote set-url origin https://${GITHUB_TOKEN}@github.com/MBA-9/athkar.git

# Push
git push origin main

# Remove token from remote URL for security
git remote set-url origin https://github.com/MBA-9/athkar.git

echo ""
echo "تم الرفع بنجاح!"

