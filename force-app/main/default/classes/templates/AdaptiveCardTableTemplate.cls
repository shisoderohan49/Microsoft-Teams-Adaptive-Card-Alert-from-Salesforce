public without sharing class AdaptiveCardTableTemplate implements AdaptiveCardTemplate {
    private AdaptiveCardTable table;
    private List<AdaptiveCardRow> rows;
    private List<AdaptiveCardColumn> columns;
    private List<List<AdaptiveCardTextBox>> textBoxesByRow;

    public AdaptiveCardTableTemplate(List<List<String>> tableContent) {
        TableBuildResult buildResult = createTable(tableContent);
        this.table = buildResult.table;
        this.rows = buildResult.rows;
        this.columns = buildResult.columns;
        this.textBoxesByRow = buildResult.textBoxesByRow;
    }

    public AdaptiveCardTableTemplate setRoundedCorners(Boolean roundedCorners) {
        this.table.setRoundedCorners(roundedCorners);
        return this;
    }

    public List<AdaptiveCardElement> getElements() {
        List<AdaptiveCardElement> elements = new List<AdaptiveCardElement>();
        elements.add(this.table);
        return elements;
    }

    public AdaptiveCardTableTemplate setRowsColor(List<Integer> rowNumbers, String color) {
        if (rowNumbers == null) {
            return this;
        }

        for (Integer rowNumber : rowNumbers) {
            if (rowNumber == null || rowNumber < 1 || rowNumber > this.textBoxesByRow.size()) {
                continue;
            }

            for (AdaptiveCardTextBox textBox : this.textBoxesByRow[rowNumber - 1]) {
                textBox.setColor(color);
            }
        }
        return this;
    }

    public AdaptiveCardTableTemplate setColumnsColor(List<Integer> columnNumbers, String color) {
        if (columnNumbers == null) {
            return this;
        }

        for (Integer columnNumber : columnNumbers) {
            if (columnNumber == null || columnNumber < 1 || columnNumber > this.columns.size()) {
                continue;
            }

            for (List<AdaptiveCardTextBox> rowTextBoxes : this.textBoxesByRow) {
                if (columnNumber <= rowTextBoxes.size()) {
                    rowTextBoxes[columnNumber - 1].setColor(color);
                }
            }
        }
        return this;
    }

    public AdaptiveCardTableTemplate setCellColor(Integer rowNumber, Integer columnNumber, String color) {
        if (
            rowNumber == null ||
            columnNumber == null ||
            rowNumber < 1 ||
            rowNumber > this.textBoxesByRow.size() ||
            columnNumber < 1 ||
            columnNumber > this.textBoxesByRow[rowNumber - 1].size()
        ) {
            return this;
        }

        this.textBoxesByRow[rowNumber - 1][columnNumber - 1].setColor(color);
        return this;
    }

    private static TableBuildResult createTable(List<List<String>> tableContent) {
        TableBuildResult buildResult = new TableBuildResult();
        buildResult.table = new AdaptiveCardTable(false, false);
        buildResult.rows = new List<AdaptiveCardRow>();
        buildResult.columns = new List<AdaptiveCardColumn>();
        buildResult.textBoxesByRow = new List<List<AdaptiveCardTextBox>>();

        if (tableContent != null && !tableContent.isEmpty()) {
            if (tableContent[0] != null) {
                for (Integer columnIndex = 0; columnIndex < tableContent[0].size(); columnIndex++) {
                    AdaptiveCardColumn column = new AdaptiveCardColumn(1);
                    buildResult.columns.add(column);
                    buildResult.table.addColumn(column);
                }
            }

            for (List<String> rowContent : tableContent) {
                AdaptiveCardRow row = new AdaptiveCardRow();
                List<AdaptiveCardTextBox> rowTextBoxes = new List<AdaptiveCardTextBox>();
                if (rowContent != null) {
                    for (String cellContent : rowContent) {
                        AdaptiveCardTextBox textBox = new AdaptiveCardTextBox(cellContent);
                        AdaptiveCardCell cell = new AdaptiveCardCell();
                        cell.addItem(textBox);
                        row.addCell(cell);
                        rowTextBoxes.add(textBox);
                    }
                }
                buildResult.rows.add(row);
                buildResult.textBoxesByRow.add(rowTextBoxes);
                buildResult.table.addRow(row);
            }
        }

        return buildResult;
    }

    private class TableBuildResult {
        private AdaptiveCardTable table;
        private List<AdaptiveCardRow> rows;
        private List<AdaptiveCardColumn> columns;
        private List<List<AdaptiveCardTextBox>> textBoxesByRow;
    }
}