#!/bin/bash

# Define file paths
XML_DIR="/Users/ah3264/Documents/JATSHTML/JATSHTML-processor/articles"
XSLT_CITATIONS="/Users/ah3264/Documents/JATSHTML/JATSHTML-processor/jats-APAcit.xsl"
XSLT_HTML="/Users/ah3264/Documents/JATSHTML/JATSHTML-processor/jats-html.xsl"
TEMP_CITATIONS="citations.xml"
SAXON_JAR="/Users/ah3264/Documents/JATSHTML/SaxonHE12-5J/saxon-he-12.5.jar"

# Process each XML file in the directory
for XML_FILE in "$XML_DIR"/*.xml; do
  # Extract the base name of the file (without directory and extension)
  BASE_NAME=$(basename "$XML_FILE" .xml)
  
  # Define the output HTML file name
  OUTPUT_FILE="$XML_DIR/$BASE_NAME.html"
  
  # Apply the first XSLT transformation to generate citations.xml
  java -cp "$SAXON_JAR" net.sf.saxon.Transform -s:"$XML_FILE" -xsl:"$XSLT_CITATIONS" -o:"$TEMP_CITATIONS"
  
  # Apply the second XSLT transformation to generate the HTML file
  java -cp "$SAXON_JAR" net.sf.saxon.Transform -s:"$TEMP_CITATIONS" -xsl:"$XSLT_HTML" -o:"$OUTPUT_FILE"
  
  # Clean up temporary file
  rm "$TEMP_CITATIONS"
done

echo "Transformation completed successfully for all XML files in $XML_DIR"