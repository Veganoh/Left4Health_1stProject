package org.meia.anxietyDiagnosis;

import com.google.gson.Gson;
import com.google.gson.JsonObject;
import com.google.gson.reflect.TypeToken;
import org.meia.model.*;

import java.io.*;
import java.util.List;
import java.util.Scanner;

public class Reader {

    private static final String FILEPATH_40 = "src/main/resources/meia/quiz40.json";

    private static final String FILEPATH_QUESTIONS = "src/main/resources/meia/Perguntas.txt";

    /**
     * Guarda as perguntas do questionário dentro do objeto quiz
     * @param quiz, o objeto onde vão ser guardadas as perguntas
     * @throws FileNotFoundException, a exceção lançada caso não se encontre file
     */
    public static void readQuestionsFromFile(Quiz quiz) throws FileNotFoundException {

        Scanner in = new Scanner(new File(FILEPATH_QUESTIONS));

        while (in.hasNextLine()) {
            String id = in.nextLine();
            String category = in.nextLine();
            String questionText = in.nextLine();

            Question q = new Question(id, questionText, category);
            quiz.addQuestion(q);
        }
    }

    /**
     *
     * @param quiz
     */
    public static void assignAnswersToQuiz40(Quiz quiz) {
        Gson gson = new Gson();

        try (FileReader reader = new FileReader(FILEPATH_40)) {
            JsonObject jsonData = gson.fromJson(reader, JsonObject.class);
            List<Question> answerDataList = gson.fromJson(jsonData.getAsJsonArray("Quiz40"), new TypeToken<List<Question>>(){}.getType());

            for (Question answerData : answerDataList) {
                String  id = answerData.getId();
                String answer = answerData.getAnswer();
                quiz.addAnswerToQuestion(id, answer);
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void assignAnswersToQuiz(Quiz quiz, String string){
        Scanner in = new Scanner(string);
        while(in.hasNextLine()){
            String id = in.nextLine();
            String answer = in.nextLine();
            quiz.addAnswerToQuestion(id,answer);
        }
        in.close();
    }
}