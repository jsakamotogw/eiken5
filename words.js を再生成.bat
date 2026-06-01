@echo off
chcp 65001 > nul
cd /d "%~dp0"
echo ============================================
echo  英検アプリ words.js 再生成ツール
echo ============================================
echo.
echo data\words.json を読み込んで words.js を作り直します...
echo.
python -c "import json; d=json.load(open('data/words.json',encoding='utf-8')); f=open('words.js','w',encoding='utf-8'); f.write('// 英検5級 たんごデータ（自動生成）。編集は data/words.json 側を直し、このバッチで再生成してください。\n'); f.write('window.EIKEN_WORDS = '); json.dump(d['words'], f, ensure_ascii=False, indent=1); f.write(';\n'); f.close(); print('  完了：', len(d['words']), '語を words.js に書き出しました')"
echo.
echo ============================================
echo  このあと words.js を GitHub にアップロードすれば公開反映されます
echo  （手順は 公開手順.md を参照）
echo ============================================
echo.
pause
