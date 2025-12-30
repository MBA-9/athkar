# دليل إعداد GitHub و Xcode - خطوة بخطوة

## ✅ الخطوة 1: إضافة SSH Key إلى GitHub

1. **انسخ المفتاح** (تم نسخه تلقائياً):
   ```
   ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJ4/Pcm4xiPQeOs9GcZ9UIQhQA9x9sflPdkUMY+4NWdT athkar-auto
   ```

2. **في صفحة GitHub** (أنت فيها الآن):
   - اضغط على زر **"New SSH key"** (الأخضر)
   - **Title**: اكتب "MacBook - Athkar Project"
   - **Key**: الصق المفتاح (Cmd+V)
   - اضغط **"Add SSH key"**

## ✅ الخطوة 2: اختبار الاتصال

بعد إضافة المفتاح، شغّل هذا الأمر في Terminal:
```bash
ssh -T git@github.com -i ~/.ssh/id_ed25519_athkar
```

إذا نجح، سترى: `Hi MBA-9! You've successfully authenticated...`

## ✅ الخطوة 3: تغيير Remote URL إلى SSH

```bash
cd "/Users/MBA/Desktop/untitled folder 2/athkar"
git remote set-url origin git@github.com:MBA-9/athkar.git
```

## ✅ الخطوة 4: رفع التغييرات

```bash
git push origin main
```

## ✅ الخطوة 5: ربط Xcode مع GitHub

### الطريقة 1: من خلال Xcode مباشرة

1. **افتح Xcode**
2. **افتح مشروعك** (أو أنشئ مشروع جديد)
3. **Source Control → Clone...**
4. **الصق رابط المشروع**: `git@github.com:MBA-9/athkar.git`
5. **اختر مكان الحفظ**
6. Xcode سيستخدم SSH key تلقائياً

### الطريقة 2: إضافة المشروع الموجود

1. **افتح Xcode**
2. **File → Add Files to "[Project Name]"...**
3. **اختر مجلد المشروع**: `/Users/MBA/Desktop/untitled folder 2/athkar`
4. **تأكد من**: ✅ "Copy items if needed" (إذا لزم)
5. **تأكد من**: ✅ "Create groups"
6. **Source Control → Create Git Repositories...** (إذا لم يكن موجود)

### الطريقة 3: ربط مشروع موجود مع GitHub

1. **Source Control → [Project Name] → Configure [Project Name]...**
2. **Remotes** → **+** → **Add Remote**
3. **Remote Name**: `origin`
4. **Remote URL**: `git@github.com:MBA-9/athkar.git`
5. **OK**

## ✅ الخطوة 6: رفع التغييرات من Xcode

1. **Source Control → Commit...** (Cmd+Option+C)
2. **اكتب رسالة Commit**
3. **اضغط "Commit"**
4. **Source Control → Push...** (Cmd+Shift+P)
5. **اختر Branch**: `main`
6. **Push**

## 🔧 إعدادات Xcode الإضافية

### إعداد Git في Xcode:
1. **Xcode → Settings → Accounts**
2. **+** → **GitHub**
3. **Sign in with GitHub** (اختياري - للوصول السهل)

### إعداد Source Control:
1. **Xcode → Settings → Source Control**
2. **تأكد من**: ✅ "Enable Source Control"
3. **Default branch name**: `main`

## 📝 ملاحظات مهمة

- ✅ الملفات منظمة في `AthkarJSON/` مع المجلدات العربية
- ✅ الأرقام محذوفة من أسماء الملفات
- ✅ التغييرات محفوظة في commit محلي
- ⚠️ تحتاج فقط إلى رفعها على GitHub

## 🆘 حل المشاكل

### إذا لم يعمل SSH:
```bash
# تحقق من المفتاح
cat ~/.ssh/id_ed25519_athkar.pub

# أضف المفتاح إلى ssh-agent
ssh-add ~/.ssh/id_ed25519_athkar

# اختبر الاتصال
ssh -T git@github.com
```

### إذا Xcode لا يتعرف على Git:
1. **Xcode → Settings → Locations**
2. **Command Line Tools**: اختر Xcode version
3. **أعد تشغيل Xcode**

