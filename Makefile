# Ignore files
.Phony: install all clean 

# Souce informations
SOURCE_DIR = src

# Target informations
TARGET_DIR = build
TARGET_FILE_NAME = doc

# If document doesnt exists
all: 01/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf

# First part of project
01/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf: 01/$(SOURCE_DIR)/$(TARGET_FILE_NAME).tex
	- mkdir 01/$(TARGET_DIR) && pdflatex -output-directory 01/$(TARGET_DIR) 01/$(SOURCE_DIR)/$(TARGET_FILE_NAME).tex
	- ln -s 01/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf 01.pdf

# Clean project 
clean: 
	rm -r 01/$(TARGET_DIR) && rm 01.pdf > /dev/null

# Install important packages for latex build 
install:
	apt-get update