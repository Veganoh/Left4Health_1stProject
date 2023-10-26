package org.meia.anxietyDiagnosis;

import org.meia.model.*;

import com.google.gson.Gson;

import java.io.FileReader;
import java.io.IOException;

public class JsonReader {

    private static final String FILEPATH_INITIAL = "src/main/resources/meia/quizInitial.json";
    private static final String FILEPATH_40 = "src/main/resources/meia/quiz40.json";

    public Quiz readQuiz(String filePath) {
        try {
            Gson gson = new Gson();

            return gson.fromJson(new FileReader(filePath), Quiz.class);
        } catch (IOException e) {
            e.printStackTrace();
            return null;
        }
    }

    public Quiz readQuizInitial() {
        return readQuiz(FILEPATH_INITIAL);
    }

    public void readQuiz40(Quiz previousQuiz) {
        Quiz quiz40 = readQuiz(FILEPATH_40);
        if (quiz40 != null) {
            previousQuiz.setQuiz40(quiz40.getQuiz40());
        }
    }
}