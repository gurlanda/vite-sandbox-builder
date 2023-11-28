
#!/bin/bash

# After execution:
#   - Initialize a Firebase project and needed Firebase services on the Firebase Console.
#   - Manually run firebase init

# There must be exactly two arguments
#   Argument 1: Project folder name (e.g. pwa-sandbox)
#   Argument 2: Public project name (e.g. "PWA Sandbox")
if [ "$#" -ne 2 ]; then
  echo "Usage:  ./sb-builder.sh [Project folder name] [Public project name]"
  exit 1
fi

faint="\e[2m"
end_color="\e[0m"
start_blue="\e[36m"

prefix() {
  local message_prefix='vite-boilerplate:'
  local message_body="$1"
  printf '%b%b%b ' ${faint} ${message_prefix} ${end_color}
  echo ${message_body}
}

project_folder="${1:-new-sandbox}"
client_folder="client"

prefix 'Creating a sandbox!'
prefix 'Creating directory structure...'
mkdir ${project_folder}
mkdir ${project_folder}/${client_folder}

prefix 'Installing React, Firebase, Typescript, React Router Dom, and TailwindCSS...'
cd ${project_folder}/${client_folder}
npm create vite@latest . -- --template react-ts
npm i firebase react-router-dom
npm i -D @types/react-router-dom tailwindcss postcss autoprefixer

# Remove some unneeded boilerplate files created by Vite
# Current location: /Sandboxes/[project-folder]/client
prefix 'Remove unneeded files...'
rm public/vite.svg
rm src/App.css
rm -r src/assets
rm README.md
rm index.html

# Copy template files to the project folder
prefix 'Apply template files...'
cd ../.. # Now in /Sandboxes
cp -R .vite-sandbox-template/ ${project_folder}/

# Replace instances of Public with the project's public name
# within template files
cd ${project_folder}/${client_folder}
# Current location: /Sandboxes/[project-folder]/client
sed -i '' "s/ Public_Name /$2/g" index.html
sed -i '' "s/Public_Name/$2/g" src/pages/Home.tsx

# Replace instances of PROJ_NAME with the project's name
# within template files
cd .. # Now in /Sandboxes/[project-folder]
sed -i '' "s/PROJ_NAME/$1/g" package.json

npm run build
git init
git add .
git commit -m "First commit"
git branch -M master main

echo ''
prefix
echo 'Finished! Sandbox built.'
echo "If you haven't already, please initialize your Firebase project"
echo "and any services you may need on the Firebase Console. Then run: "
echo ''
printf '  %bcd%b %b \n' ${start_blue} ${end_color} ${project_folder}
printf '  %bfirebase%b init \n' ${start_blue} ${end_color}
echo ''