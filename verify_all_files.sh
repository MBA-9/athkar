#!/bin/bash
# Script to verify all JSON files are valid and have correct screenKey

echo "🔍 التحقق من جميع ملفات JSON..."
echo ""

ERRORS=0
TOTAL=0

# Function to check JSON file
check_file() {
    local file="$1"
    local expected_screenkey="$2"
    local expected_category="$3"
    
    # Check if file exists - skip if not found (might be deleted intentionally)
    if [ ! -f "$file" ]; then
        echo "⏭️  تخطي (ملف محذوف): $file"
        return 0
    fi
    
    TOTAL=$((TOTAL + 1))
    
    # Check JSON validity
    if ! python3 -m json.tool "$file" > /dev/null 2>&1; then
        echo "❌ JSON غير صحيح: $file"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
    
    # Extract screenKey from JSON
    local screenkey=$(python3 -c "import json, sys; data = json.load(open('$file')); print(data.get('screenKey', 'NOT_FOUND'))" 2>/dev/null)
    
    if [ "$screenkey" != "$expected_screenkey" ]; then
        echo "⚠️  screenKey غير متطابق: $file"
        echo "   المتوقع: $expected_screenkey"
        echo "   الموجود: $screenkey"
        ERRORS=$((ERRORS + 1))
        return 1
    fi
    
    echo "✅ $file (screenKey: $screenkey)"
    return 0
}

# Main menu files
check_file "AthkarJSON/القائمه الرئيسيه/اذكار الصباح/Morning Remembrances.json" "morning" "morning"
check_file "AthkarJSON/القائمه الرئيسيه/اذكار المساء/Evening Remembrances.json" "evening" "evening"
check_file "AthkarJSON/القائمه الرئيسيه/اذكار النوم/Sleep Remembrances.json" "sleep" "sleep"
check_file "AthkarJSON/القائمه الرئيسيه/اذكار الاستيقاظ/Waking Up Remembrances.json" "wakeUp" "wakeUp"
check_file "AthkarJSON/القائمه الرئيسيه/التسابيح/Praises.json" "tasbeeh" "tasbeeh"
check_file "AthkarJSON/القائمه الرئيسيه/اذكار بعد الصلاه/Post-Prayer Remembrances.json" "postPrayer" "postPrayer"
check_file "AthkarJSON/القائمه الرئيسيه/اسماء الله الحسنى/The Beautiful Names of Allah.json" "beautifulNames" "beautifulNames"
check_file "AthkarJSON/القائمه الرئيسيه/ادعية الوالدين/Prayers for Parents.json" "duaForParents" "duaForParents"
check_file "AthkarJSON/القائمه الرئيسيه/ادعيه تيسير الامور و التوفيق/Prayers for Easing Affairs and Success.json" "duaForSuccess" "duaForSuccess"
check_file "AthkarJSON/القائمه الرئيسيه/ادعيه الرزق/Prayers for Sustenance.json" "duaForRizq" "duaForRizq"
check_file "AthkarJSON/القائمه الرئيسيه/ادعيه الزواج/Prayers for Marriage.json" "duaForMarriage" "duaForMarriage"
check_file "AthkarJSON/القائمه الرئيسيه/جوامع الدعاء/Comprehensive Supplications.json" "comprehensiveDua" "comprehensiveDua"
check_file "AthkarJSON/القائمه الرئيسيه/اذكار الحج و العمره/Hajj and Umrah Remembrances.json" "hajj" "hajj"
check_file "AthkarJSON/القائمه الرئيسيه/دعاء ختم القران/Quran Completion Prayer.json" "quranCompletion" "quranCompletion"
check_file "AthkarJSON/القائمه الرئيسيه/فضل القران/Quran Virtue.json" "quranVirtue" "quranVirtue"

# Submenu files
check_file "AthkarJSON/قسم فرعي اذكار متنوعه/اذكار المنزل/Home Remembrances.json" "home" "home"
check_file "AthkarJSON/قسم فرعي اذكار متنوعه/اذكار المسجد/Mosque Remembrances.json" "mosque" "mosque"
check_file "AthkarJSON/قسم فرعي اذكار متنوعه/أذكار الآذان/Adhan Remembrances.json" "adhan" "adhan"
check_file "AthkarJSON/قسم فرعي اذكار متنوعه/أذكار الوضوء/Wudu Remembrances.json" "wudu" "wudu"
check_file "AthkarJSON/قسم فرعي اذكار متنوعه/أذكار الطعام/Food Remembrances.json" "food" "food"
check_file "AthkarJSON/قسم فرعي اذكار متنوعه/أذكار الخلاء/Bathroom Remembrances.json" "bathroom" "bathroom"
check_file "AthkarJSON/قسم فرعي اذكار متنوعه/أذكار السفر/Travel Remembrances.json" "travel" "travel"
check_file "AthkarJSON/قسم فرعي الأدعيه المأثوره/ادعيه نبويه/Prophetic Supplications.json" "propheticDua" "propheticDua"
check_file "AthkarJSON/قسم فرعي الأدعيه المأثوره/الأدعيه القرانيه/Quranic Prayers.json" "quranicDua" "quranicDua"
check_file "AthkarJSON/قسم فرعي الأدعيه المأثوره/ادعيه للأنبياء/Prayers of the Prophets.json" "prophets" "prophets"
check_file "AthkarJSON/قسم فرعي ادعيه العبادات/ادعيه قيام اليل/Night Prayer Supplications.json" "duaQiyam" "duaQiyam"
check_file "AthkarJSON/قسم فرعي ادعيه العبادات/ادعيه الوتر/Witr Prayers.json" "duaWitr" "duaWitr"
check_file "AthkarJSON/قسم فرعي ادعيه العبادات/ادعيه لاستخاره/Prayer of Istikhara.json" "duaIstikhara" "duaIstikhara"
check_file "AthkarJSON/قسم فرعي ادعيه للمتوفي/دعاء للميت (ذكر)/Prayer for the Deceased (Male).json" "deceasedMale" "deceasedMale"
check_file "AthkarJSON/قسم فرعي ادعيه للمتوفي/دعاء للميت (أنثى)/Prayer for the Deceased (Female).json" "deceasedFemale" "deceasedFemale"
check_file "AthkarJSON/قسم فرعي ادعيه للمتوفي/دعاء لطفل رضيع/Prayer for a Newborn.json" "deceasedChild" "deceasedChild"
check_file "AthkarJSON/قسم فرعي الرقيه الشرعيه/الرقية الشرعية المختصره/Short Ruqyah.json" "ruqyahShort" "ruqyahShort"
check_file "AthkarJSON/قسم فرعي الرقيه الشرعيه/الرقية الشرعية الكاملة/Complete Ruqyah.json" "ruqyahComplete" "ruqyahComplete"
check_file "AthkarJSON/قسم فرعي الرقيه الشرعيه/رقية العين والحسد/Ruqyah for Evil Eye and Envy.json" "ruqyahEye" "ruqyahEye"
check_file "AthkarJSON/قسم فرعي الرقيه الشرعيه/رقية السحر/Ruqyah for Magic.json" "ruqyahMagic" "ruqyahMagic"
check_file "AthkarJSON/قسم فرعي الرقيه الشرعيه/رقية المرض/Ruqyah for Illness.json" "ruqyahIllness" "ruqyahIllness"
check_file "AthkarJSON/قسم فرعي الرقيه الشرعيه/رقية الأطفال/Ruqyah for Children.json" "ruqyahChildren" "ruqyahChildren"

echo ""
echo "=========================================="
echo "📊 النتيجة:"
echo "   ✅ الملفات الصحيحة: $((TOTAL - ERRORS))"
echo "   ❌ الملفات التي تحتاج إصلاح: $ERRORS"
echo "   📦 المجموع: $TOTAL"
echo "=========================================="

if [ $ERRORS -eq 0 ]; then
    echo "🎉 جميع الملفات صحيحة!"
    exit 0
else
    echo "⚠️  يوجد ملفات تحتاج إصلاح"
    exit 1
fi

