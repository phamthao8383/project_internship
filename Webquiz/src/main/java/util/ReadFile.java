package util;

import model.Question;
import model.Subject;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import java.io.*;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;

public class ReadFile {
    public static final int COLUMN_QUESTION_ID = 0;
    public static final int COLUMN_DESCRIPTION = 1;
    public static final int COLUMN_ANSWER_1 = 2;
    public static final int COLUMN_ANSWER_2 = 3;
    public static final int COLUMN_ANSWER_3 = 4;
    public static final int COLUMN_ANSWER_4 = 5;
    public static final int COLUMN_CORRECT_ANSWER = 6;
    public static final int COLUMN_SUBJECT_ID = 7;



    public static List<Question> ReadFileQuestion() throws IOException {
        List<Question> questions = new ArrayList<>();
        FileInputStream inputStream = new FileInputStream(new File("C:\\Users\\nhacp\\Downloads\\de_12.XLSX"));
        XSSFWorkbook wb = new XSSFWorkbook(inputStream);
        XSSFSheet sheet = wb.getSheetAt(0);
        FormulaEvaluator formulaEvaluator = wb.getCreationHelper().createFormulaEvaluator();
        for (Row row : sheet) {

            // Set value for book object
            Question question = new Question();
            if (row.getRowNum() > 0) {
                for (Cell cell : row) {
                    if (cell.getColumnIndex() == COLUMN_QUESTION_ID) {
                        String c = cell.toString();
                        int d = (int) Double.parseDouble(c);
                        System.out.println(d);
                        question.setQuestion_id(d);
                    }
                    if (cell.getColumnIndex() == COLUMN_DESCRIPTION) {
                        String i = cell.toString();
                        System.out.println(i);
                        question.setDescription(i);
                    }
                    if (cell.getColumnIndex() == COLUMN_ANSWER_1) {
                        String i = cell.toString();
                        System.out.println(i);
                        question.setAnswer1(i);
                    }
                    if (cell.getColumnIndex() == COLUMN_ANSWER_2) {
                        String i = cell.toString();
                        System.out.println(i);
                        question.setAnswer2(i);
                    }
                    if (cell.getColumnIndex() == COLUMN_ANSWER_3) {
                        String i = cell.toString();
                        System.out.println(i);
                        question.setAnswer3(i);
                    }
                    if (cell.getColumnIndex() == COLUMN_ANSWER_4) {
                        String i = cell.toString();
                        System.out.println(i);
                        question.setAnswer4(i);
                    }
                    if (cell.getColumnIndex() == COLUMN_CORRECT_ANSWER) {
                        String i = cell.toString();
                        System.out.println(i);
                        question.setCorrect_answer(i);
                    }
                    if (cell.getColumnIndex() == COLUMN_SUBJECT_ID) {
                        String c = cell.toString();
                        int d = (int) Double.parseDouble(c);
                        question.setSubject(new Subject(d));
                        System.out.println(d);

                    }

                }
                questions.add(question);
            }


        }
        wb.close();
        inputStream.close();
        return questions;
    }
    public static void main(String[] args) throws IOException {
//        final String excelFilePath = "C:\\Users\\nhacp\\Downloads\\de_12.XLSX";
//        final List<Question> questions = readExcel(excelFilePath);
//        for (Question question : questions) {
//            System.out.println(question);
//        }
        List<Question> abc =  ReadFileQuestion();
        for (Question q: abc
             ) {
            System.out.println(q);
        }
    }

    public static List<Question> readExcel(String excelFilePath) throws IOException {
        List<Question> questions = new ArrayList<>();

        // Get file
        InputStream inputStream = new FileInputStream(new File(excelFilePath));

        // Get workbook
        Workbook workbook = getWorkbook(inputStream, excelFilePath);

        // Get sheet
        Sheet sheet = workbook.getSheetAt(0);

        // Get all rows
        Iterator<Row> iterator = sheet.iterator();
        while (iterator.hasNext()) {
            Row nextRow = iterator.next();
            if (nextRow.getRowNum() == 0) {
                // Ignore header
                continue;
            }

            // Get all cells
            Iterator<Cell> cellIterator = nextRow.cellIterator();

            // Read cells and set value for book object
            Question question = new Question();
            while (cellIterator.hasNext()) {
                //Read cell
                Cell cell = cellIterator.next();
                Object cellValue = getCellValue(cell);
                if (cellValue == null || cellValue.toString().isEmpty()) {
                    continue;
                }
                // Set value for book object
                int columnIndex = cell.getColumnIndex();
                switch (columnIndex) {
                    case COLUMN_QUESTION_ID:
                        question.setQuestion_id(new BigDecimal((double) cellValue).intValue());
                        break;
                    case COLUMN_DESCRIPTION:
                        question.setDescription((String) getCellValue(cell));
                        break;
                    case COLUMN_ANSWER_1:
                        question.setAnswer1((String) getCellValue(cell));
                        break;
                    case COLUMN_ANSWER_2:
                        question.setAnswer2((String) getCellValue(cell));
                        break;
                    case COLUMN_ANSWER_3:
                        question.setAnswer3((String) getCellValue(cell));
                        break;
                    case COLUMN_ANSWER_4:
                        question.setAnswer4((String) getCellValue(cell));
                        break;
                    case COLUMN_CORRECT_ANSWER:
                        question.setCorrect_answer((String) getCellValue(cell));
                        break;
                    case COLUMN_SUBJECT_ID:
                        question.setSubject(new BigDecimal((double) cellValue).intValue());
                        break;
                    default:
                        break;
                }

            }
            questions.add(question);
        }

        workbook.close();
        inputStream.close();

        return questions;
    }

    // Get Workbook
    private static Workbook getWorkbook(InputStream inputStream, String excelFilePath) throws IOException {
        Workbook workbook = null;
        if (excelFilePath.endsWith("xlsx")) {
            workbook = new XSSFWorkbook(inputStream);
        } else if (excelFilePath.endsWith("xls")) {
            workbook = new HSSFWorkbook(inputStream);
        } else {
            throw new IllegalArgumentException("The specified file is not Excel file");
        }

        return workbook;
    }

    // Get cell value
    private static Object getCellValue(Cell cell) {
        CellType cellType = cell.getCellTypeEnum();
        Object cellValue = null;
        switch (cellType) {
            case BOOLEAN:
                cellValue = cell.getBooleanCellValue();
                break;
            case FORMULA:
                Workbook workbook = cell.getSheet().getWorkbook();
                FormulaEvaluator evaluator = workbook.getCreationHelper().createFormulaEvaluator();
                cellValue = evaluator.evaluate(cell).getNumberValue();
                break;
            case NUMERIC:
                cellValue = cell.getNumericCellValue();
                break;
            case STRING:
                cellValue = cell.getStringCellValue();
                break;
            case _NONE:
            case BLANK:
            case ERROR:
                break;
            default:
                break;
        }

        return cellValue;
    }
}
