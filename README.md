# publicera_HTML
This project is designed to process XML data using XSLT transformations. It utilizes Saxon, a powerful XSLT and XQuery processor, to transform the XML file into a final HTML output.

## Project Structure

- `process.sh`: A shell script that orchestrates the transformation process.
- `jats-APAcit.xsl`: The first XSLT file that transforms the XML data into a temporary citations file.
- `jats-html.xsl`: The second XSLT file that converts the temporary citations file into the final HTML output.
- `README.md`: This documentation file.
- `educare.css`: CSS file to render the HTML correctly

jats-APAcit.xsl, jats-html.xsl and educare.css (jats-preview.css at NCBI) are slightly modified versions of files from https://github.com/ncbi/JATSPreviewStylesheets

## How to Run the Script

            #1. Ensure you have Saxon installed on your system. You can download it from [Saxon website](http://saxon.sourceforge.net/).
            2. Define file structures in process.sh 
            3. Put the XML files you want to transform in the directory defined in XML_DIR
            4. Open a terminal and navigate to the project director
            5. Run the processing script


## Dependencies

- Saxon: Make sure Saxon is installed and accessible in your system's PATH.

## Output

After running the script, the final output will be generated as `article.html` in the project directory. The intermediate file `citations.xml` will also be created during the process.
