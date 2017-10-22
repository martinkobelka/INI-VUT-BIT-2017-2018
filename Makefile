# Ignore files
.Phony: install all clean 

# Souce informations
SOURCE_DIR = src

# Target informations
TARGET_DIR = build
TARGET_FILE_NAME = doc

# If document doesnt exists
all: 01/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf 02/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf

# First part of project
01/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf: clean 01/$(SOURCE_DIR)/$(TARGET_FILE_NAME).tex
	- rm -rf 01/$(TARGET_DIR) && mkdir 01/$(TARGET_DIR) && pdflatex -output-directory 01/$(TARGET_DIR) 01/$(SOURCE_DIR)/$(TARGET_FILE_NAME).tex
	- rm -f 01.pdf && ln -s 01/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf 01.pdf

# First part of project
02/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf: clean 02/$(SOURCE_DIR)/$(TARGET_FILE_NAME).tex
	- rm -rf 02/$(TARGET_DIR) && mkdir 02/$(TARGET_DIR) && pdflatex -output-directory 02/$(TARGET_DIR) 02/$(SOURCE_DIR)/$(TARGET_FILE_NAME).tex
	- rm -f 02.pdf && ln -s 02/$(TARGET_DIR)/$(TARGET_FILE_NAME).pdf 02.pdf

# Clean project 
clean: 
	rm -rf 01/$(TARGET_DIR) && rm -rf 01.pdf > /dev/null
	rm -rf 02/$(TARGET_DIR) && rm -rf 02.pdf > /dev/null

# Install important packages for latex build 
install:
	apt-get update && apt install --no-install-recommends texlive-latex-base texlive-latex-extra texlive-fonts-recommended texlive-lang-czechslovak texlive-science texlive-latex-recommended