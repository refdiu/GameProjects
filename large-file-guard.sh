# large-file-guard.sh
# ---------------------------------------
# Run:  bash large-file-guard.sh
# ---------------------------------------

echo "🔧 Setting up Large-File-Guard..."

# 1. Create .gitignore
cat > .gitignore <<'EOF'
# Build outputs
build/
dist/
release/
*.AppImage
*.exe
*.zip
*.tar
*.love
*.dll
*.so
*.dylib

# Intermediate / cache
*.obj
*.o
*.pyc
*.log
*.tmp

# IDEs / OS junk
.vscode/
.idea/
.DS_Store
Thumbs.db
EOF

git add .gitignore
git commit -m "Add .gitignore for build and binary files" >/dev/null 2>&1 || true

# 2. Add pre-push hook
mkdir -p .git/hooks
cat > .git/hooks/pre-push <<'HOOK'
#!/bin/sh
max_size=100000000  # 100 MB
echo "🔍 Checking for large files before push..."
large_files=$(git rev-list --objects --all | \
  git cat-file --batch-check='%(objecttype) %(objectname) %(objectsize) %(rest)' | \
  awk -v max=$max_size '$1=="blob" && $3>max {printf "%.2f MB\t%s\n", $3/1024/1024, $4}')
if [ -n "$large_files" ]; then
  echo "🚫 Large files detected (over 100 MB):"
  echo "$large_files"
  echo "❌ Push blocked. Use Git LFS or remove these files from history."
  exit 1
fi
echo "✅ No large files found. Safe to push."
HOOK
chmod +x .git/hooks/pre-push

# 3. Optional Git LFS setup (safe if not installed)
if command -v git-lfs >/dev/null 2>&1; then
  echo "⚙️  Configuring Git LFS..."
  git lfs install --skip-smudge >/dev/null 2>&1
  git lfs track "*.AppImage" "*.zip" "*.love" >/dev/null 2>&1
  git add .gitattributes
  git commit -m "Track large binary files with Git LFS" >/dev/null 2>&1 || true
else
  echo "ℹ️  Git LFS not found. Install via:  sudo apt install git-lfs  (or brew install git-lfs)"
fi

echo "✅ Large-File-Guard setup complete!"
