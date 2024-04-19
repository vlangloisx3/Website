#!/bin/bash

# command to run in the terminal
# chmod +x create_post.sh
# ./create_post.sh

# Get input from the user
read -p "Enter the desired number for directory label (e.g., 01): " number
read -p "Enter the title: " title
read -p "Enter the excerpt: " excerpt
read -p "Enter the listing URL: " url
read -p "Enter the markdown text: " text

# Create directory with label
mkdir "m$number"
cd "m$number"

# Get today's date
date=$(date +"%Y-%m-%d")

# Create markdown file with provided content
cat <<EOF > "index.md"
---
author: 
categories:
date: "${date}"
draft: false
excerpt: "${excerpt}"
layout: single

EOF

# Conditionally add the links section if the URL is not empty
if [ -n "$url" ]; then
cat <<EOF >> "index.md"
links:
- icon: shopping-bag
  icon_pack: fas
  name: Etsy
  url: "${url}"
EOF
fi

cat <<EOF >> "index.md"
subtitle: 
tags:
title: "${title}"
---
${text}

![${title}](featured.webp)
EOF

echo "Markdown file index.md $title created in directory m$number"
