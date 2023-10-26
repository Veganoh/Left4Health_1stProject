package org.meia.model;

import java.util.ArrayList;
import java.util.List;

public class Quiz {
    private List<Question> quizInitial;
    private List<QuestionCategory> quiz40;

    private List<Answer> answers;

    public Quiz() {
        this.answers = new ArrayList<>();  // Inicializa a lista de respostas
    }

    public List<Question> getQuizInitial() {
        return quizInitial;
    }

    public void setQuizInitial(List<Question> quizInitial) {
        this.quizInitial = quizInitial;
    }

    public List<QuestionCategory> getQuiz40() {
        return quiz40;
    }

    public void setQuiz40(List<QuestionCategory> quiz40) {
        this.quiz40 = quiz40;
    }

    public List<Question> getQuestionsForCategory(String category) {
        for (QuestionCategory questionCategory : quiz40) {
            if (questionCategory.getCategory().equals(category)) {
                return questionCategory.getCategoryQuestionList();
            }
        }
        return null;
    }

    public void addQuestionsToCategory(String category, List<Question> questions) {
        for (QuestionCategory questionCategory : quiz40) {
            if (questionCategory.getCategory().equals(category)) {
                questionCategory.getCategoryQuestionList().addAll(questions);
            }
        }
    }

    // Método para inicializar as perguntas no Quiz40
    public void initializeQuiz40Questions() {
        quiz40 = new ArrayList<>();

        // Crie e adicione as perguntas para cada tipo de ansiedade
        // Perguntas para Ansiedade Generalizada
        List<Question> perguntasAnsiedadeGeneralizada = new ArrayList<>();
        perguntasAnsiedadeGeneralizada.add(new Question(1, "Pergunta 1 - Ansiedade Generalizada", "1"));
        perguntasAnsiedadeGeneralizada.add(new Question(2, "Pergunta 2 - Ansiedade Generalizada", "3"));
        perguntasAnsiedadeGeneralizada.add(new Question(3, "Pergunta 3 - Ansiedade Generalizada", "2"));
        perguntasAnsiedadeGeneralizada.add(new Question(4, "Pergunta 4 - Ansiedade Generalizada", "4"));
        perguntasAnsiedadeGeneralizada.add(new Question(5, "Pergunta 5 - Ansiedade Generalizada", "5"));

        // Perguntas para Síndrome de Pânico
        List<Question> perguntasSindromeDePanico = new ArrayList<>();
        perguntasSindromeDePanico.add(new Question(1, "Pergunta 1 - Síndrome de Pânico", "1"));
        perguntasSindromeDePanico.add(new Question(2, "Pergunta 2 - Síndrome de Pânico", "3"));
        perguntasSindromeDePanico.add(new Question(3, "Pergunta 3 - Síndrome de Pânico", "2"));
        perguntasSindromeDePanico.add(new Question(4, "Pergunta 4 - Síndrome de Pânico", "4"));
        perguntasSindromeDePanico.add(new Question(5, "Pergunta 5 - Síndrome de Pânico", "5"));

        // Perguntas para Síndrome de Pânico com Agorafobia
        List<Question> perguntasSindromeDePanicoAgorafobia = new ArrayList<>();
        perguntasSindromeDePanicoAgorafobia.add(new Question(1, "Pergunta 1 - Síndrome de Pânico com Agorafobia", "1"));
        perguntasSindromeDePanicoAgorafobia.add(new Question(2, "Pergunta 2 - Síndrome de Pânico com Agorafobia", "3"));
        perguntasSindromeDePanicoAgorafobia.add(new Question(3, "Pergunta 3 - Síndrome de Pânico com Agorafobia", "2"));
        perguntasSindromeDePanicoAgorafobia.add(new Question(4, "Pergunta 4 - Síndrome de Pânico com Agorafobia", "4"));
        perguntasSindromeDePanicoAgorafobia.add(new Question(5, "Pergunta 5 - Síndrome de Pânico com Agorafobia", "5"));

        // Perguntas para Agorafobia
        List<Question> perguntasAgorafobia = new ArrayList<>();
        perguntasAgorafobia.add(new Question(1, "Pergunta 1 - Agorafobia", "1"));
        perguntasAgorafobia.add(new Question(2, "Pergunta 2 - Agorafobia", "3"));
        perguntasAgorafobia.add(new Question(3, "Pergunta 3 - Agorafobia", "2"));
        perguntasAgorafobia.add(new Question(4, "Pergunta 4 - Agorafobia", "4"));
        perguntasAgorafobia.add(new Question(5, "Pergunta 5 - Agorafobia", "5"));

        // Perguntas para Fobia Específica
        List<Question> perguntasFobiaEspecifica = new ArrayList<>();
        perguntasFobiaEspecifica.add(new Question(1, "Pergunta 1 - Fobia Específica", "1"));
        perguntasFobiaEspecifica.add(new Question(2, "Pergunta 2 - Fobia Específica", "3"));
        perguntasFobiaEspecifica.add(new Question(3, "Pergunta 3 - Fobia Específica", "2"));
        perguntasFobiaEspecifica.add(new Question(4, "Pergunta 4 - Fobia Específica", "4"));
        perguntasFobiaEspecifica.add(new Question(5, "Pergunta 5 - Fobia Específica", "5"));

        // Perguntas para Mutismo Seletivo
        List<Question> perguntasMutismoSeletivo = new ArrayList<>();
        perguntasMutismoSeletivo.add(new Question(1, "Pergunta 1 - Mutismo Seletivo", "1"));
        perguntasMutismoSeletivo.add(new Question(2, "Pergunta 2 - Mutismo Seletivo", "3"));
        perguntasMutismoSeletivo.add(new Question(3, "Pergunta 3 - Mutismo Seletivo", "2"));
        perguntasMutismoSeletivo.add(new Question(4, "Pergunta 4 - Mutismo Seletivo", "4"));
        perguntasMutismoSeletivo.add(new Question(5, "Pergunta 5 - Mutismo Seletivo", "5"));

        // Perguntas para Ansiedade de Separação
        List<Question> perguntasAnsiedadeDeSeparacao = new ArrayList<>();
        perguntasAnsiedadeDeSeparacao.add(new Question(1, "Pergunta 1 - Ansiedade de Separação", "1"));
        perguntasAnsiedadeDeSeparacao.add(new Question(2, "Pergunta 2 - Ansiedade de Separação", "3"));
        perguntasAnsiedadeDeSeparacao.add(new Question(3, "Pergunta 3 - Ansiedade de Separação", "2"));
        perguntasAnsiedadeDeSeparacao.add(new Question(4, "Pergunta 4 - Ansiedade de Separação", "4"));
        perguntasAnsiedadeDeSeparacao.add(new Question(5, "Pergunta 5 - Ansiedade de Separação", "5"));

        // Perguntas para Fobia Social
        List<Question> perguntasFobiaSocial = new ArrayList<>();
        perguntasFobiaSocial.add(new Question(1, "Pergunta 1 - Fobia Social", "1"));
        perguntasFobiaSocial.add(new Question(2, "Pergunta 2 - Fobia Social", "3"));
        perguntasFobiaSocial.add(new Question(3, "Pergunta 3 - Fobia Social", "2"));
        perguntasFobiaSocial.add(new Question(4, "Pergunta 4 - Fobia Social", "4"));
        perguntasFobiaSocial.add(new Question(5, "Pergunta 5 - Fobia Social", "5"));

        // Associar as listas de perguntas às categorias de ansiedade
        quiz40.add(new QuestionCategory("Ansiedade Generalizada", perguntasAnsiedadeGeneralizada));
        quiz40.add(new QuestionCategory("Síndrome de Pânico", perguntasSindromeDePanico));
        quiz40.add(new QuestionCategory("Pânico com Agorafobia", perguntasSindromeDePanicoAgorafobia));
        quiz40.add(new QuestionCategory("Agorafobia", perguntasAgorafobia));
        quiz40.add(new QuestionCategory("Fobia Específica", perguntasFobiaEspecifica));
        quiz40.add(new QuestionCategory("Mutismo Seletivo", perguntasMutismoSeletivo));
        quiz40.add(new QuestionCategory("Ansiedade de Separação", perguntasAnsiedadeDeSeparacao ));
        quiz40.add(new QuestionCategory("Fobia Social", perguntasFobiaSocial));
        // Repita o processo para as outras categorias de ansiedade
    }

    public void addAnswer(Answer answer) {
        this.answers.add(answer);
    }

    public List<Answer> getAnswers() {
        return this.answers;
    }

    @Override
    public String toString() {
        return "Quiz{" +
                "quizInitial=" + quizInitial +
                ", quiz40=" + quiz40 +
                '}';
    }
}
