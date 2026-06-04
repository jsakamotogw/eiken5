@echo off
chcp 65001 > nul
cd /d "%~dp0"
echo ============================================
echo  英検アプリ exam.js 再生成ツール（ほんばん形式もんだい）
echo ============================================
echo.
echo data\exam.json を読み込んで exam.js を作り直します...
echo.
python -c "import json; d=json.load(open('data/exam.json',encoding='utf-8')); f=open('exam.js','w',encoding='utf-8'); f.write('// 英検5級 ほんばん形式もんだい（自動生成）。編集は data/exam.json 側を直し、このバッチで再生成してください。\n'); f.write('window.EIKEN_EXAM = '); json.dump(d['questions'], f, ensure_ascii=False, indent=1); f.write(';\n'); f.close(); print('  完了：', len(d['questions']), '問を exam.js に書き出しました')"
echo.
echo ============================================
echo  このあと exam.js を GitHub にアップロードすれば公開反映されます
echo  （手順は 公開手順.md を参照）
echo ============================================
echo.
pause
