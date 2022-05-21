if [[ $# -eq 0 ]] ; then
    echo "No commit message given"
    exit 1
fi

echo "(0) Preparing the Pipeline"
cd /home/wv9/Year3/341/A3/COMPX341-A3/assets

echo "(1) Install"
npm install 

echo "(2) Build (Compile the application)"
if npm run build; then
    echo "Build succeded"
    
else
    echo "Build failed, exiting pipeline"
    exit
fi

echo "(3) Commit to git"
cd /home/wv9/Year3/341/A3/COMPX341-A3
git add --all
git commit -m "$1"
git push origin
cd /home/wv9/Year3/341/A3/COMPX341-A3/assets

echo "(4) Deploy the application"
if npm run start; then
    echo "Deployed successfully"
else
    echo "Deploy failed, exiting pipeline"
    exit
fi