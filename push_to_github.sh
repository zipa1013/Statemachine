#!/bin/bash
# Script to push all LaTeX files to GitHub using GitHub MCP
# This script reads files and prepares them for GitHub MCP push

echo "Starting to push LaTeX files to GitHub..."
echo "Note: This script prepares files. Actual push will be done via GitHub MCP."

# List of LaTeX files to push
FILES=(
    "00_einleitung.tex"
    "01_zielbild_scope.tex"
    "12_risiken.tex"
    "19_standards_compliance.tex"
    "20_vergleich_architekturen.tex"
    "15_vergleichsstudien.tex"
    "16_ki_integration.tex"
    "17_cybersecurity.tex"
    "18_energiemanagement.tex"
    "21_bosch_nvidia_integration.tex"
    "99_schluss_ausblick.tex"
    "11_zeitplanung.tex"
    "13_minimalstart.tex"
    "14_fallstudien_benchmarking.tex"
    "07_szenarien_usecases.tex"
    "08_simulation_auswertung.tex"
    "10_dokumentation_deliverables.tex"
    "02_taxonomie_metamodell.tex"
    "03_preevision_modellierung.tex"
    "04_synthese_metrik.tex"
    "05_transformation_konzept.tex"
    "06_technische_realisation.tex"
    "09_validierung_iteration.tex"
    "22_appstore_microservices.tex"
    "23_ee_architektur_regelwerk.tex"
    "A_anhang.tex"
)

# Count files
TOTAL=${#FILES[@]}
CURRENT=0

echo "Total files to process: $TOTAL"

for file in "${FILES[@]}"; do
    CURRENT=$((CURRENT + 1))
    filepath="thesis/latex/tex/$file"
    
    if [ -f "$filepath" ]; then
        lines=$(wc -l < "$filepath")
        echo "[$CURRENT/$TOTAL] $file: $lines lines"
    else
        echo "[$CURRENT/$TOTAL] $file: NOT FOUND"
    fi
done

echo "File listing complete. Files will be pushed via GitHub MCP."

