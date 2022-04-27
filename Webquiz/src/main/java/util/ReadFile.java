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



    public static List<Question> ReadFileQuestion(String link) throws IOException {
        List<Question> questions = new ArrayList<>();
        FileInputStream inputStream = new FileInputStream(new File(link));
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
                            question.setQuestion_id(d);
                        }
                        if (cell.getColumnIndex() == COLUMN_DESCRIPTION) {
                            String i = cell.toString();
                            question.setDescription(i);
                        }
                        if (cell.getColumnIndex() == COLUMN_ANSWER_1) {
                            String i = cell.toString();
                            question.setAnswer1(i);
                        }
                        if (cell.getColumnIndex() == COLUMN_ANSWER_2) {
                            String i = cell.toString();
                            question.setAnswer2(i);
                        }
                        if (cell.getColumnIndex() == COLUMN_ANSWER_3) {
                            String i = cell.toString();
                            question.setAnswer3(i);
                        }
                        if (cell.getColumnIndex() == COLUMN_ANSWER_4) {
                            String i = cell.toString();
                            question.setAnswer4(i);
                        }
                        if (cell.getColumnIndex() == COLUMN_CORRECT_ANSWER) {
                            String i = cell.toString();
                            question.setCorrect_answer(i);
                        }
                        if (cell.getColumnIndex() == COLUMN_SUBJECT_ID) {
                            String c = cell.toString();
                            int d = (int) Double.parseDouble(c);
                            question.setSubject(new Subject(d));
                        }

                    }
                    questions.add(question);
                }
            }
        wb.close();
        inputStream.close();
        return questions;
    }
}
