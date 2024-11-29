import os
import xml.etree.ElementTree as ET
import sys

def process_section(element, namespace, target_directory):
    """Extract terms and write to a file based on the location."""
    # Get the location (file name)
    location = element.find("./ns:files/ns:location", namespace).text

    # Extract all 'field' term attributes
    terms = [
        field.attrib["term"]
        for field in element.findall("./ns:field", namespace)
    ]

    # Remove specified prefixes
    prefixes_to_remove = [
        "http://purl.org/dc/terms/",
        "http://rs.tdwg.org/dwc/terms/",
        "https://w3id.org/gensc/terms/",
        "http://rs.gbif.org/terms/"
    ]
    stripped_terms = [
        term.strip().replace(prefix, "") for term in terms for prefix in prefixes_to_remove if term.strip().startswith(prefix)
    ]

    # Join terms with tabs
    output = "\t".join(stripped_terms)

    # Write the result to a file
    output_file = os.path.join(target_directory, location.replace(".txt", "Header.txt"))
    with open(output_file, "w") as file:
        file.write("id\t" + output + "\n")
    print(f"Written output to: {output_file}")

def process_meta_xml(file_path, target_directory):
    """Process the meta.xml file to extract terms for core and extensions."""
    # Parse the XML
    tree = ET.parse(file_path)
    root = tree.getroot()

    # Define the namespace used in the XML
    namespace = {"ns": "http://rs.tdwg.org/dwc/text/"}

    # Ensure the target directory exists
    os.makedirs(target_directory, exist_ok=True)

    # Process core section
    core_element = root.find("./ns:core", namespace)
    if core_element is not None:
        process_section(core_element, namespace, target_directory)

    # Process extension sections
    extension_elements = root.findall("./ns:extension", namespace)
    for extension in extension_elements:
        process_section(extension, namespace, target_directory)

if __name__ == "__main__":
    # Get file name and target directory from command-line arguments
    if len(sys.argv) != 3:
        print("Usage: python script.py <meta.xml> <target_directory>")
        sys.exit(1)

    meta_file = sys.argv[1]
    target_dir = sys.argv[2]
    process_meta_xml(meta_file, target_dir)
