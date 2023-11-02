package org.meia.anxietyDiagnosis;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStream;

import com.sun.net.httpserver.HttpServer;
import com.sun.net.httpserver.HttpHandler;
import com.sun.net.httpserver.HttpExchange;
import java.net.InetSocketAddress;


import org.meia.model.Quiz;


public class Server {

    private static final int serverPort = 8080;

    private static Quiz quiz;

    public static void main(String[] args) throws IOException {
        quiz = new Quiz();
        HttpServer server = HttpServer.create(new InetSocketAddress(serverPort), 0);
        server.createContext("/api/obtainInitialQuestions", new ObtainInitialQuiz());
        server.createContext("/api/answerQuizInitial", new ObtainInitialQuizResponse());
        server.setExecutor(null);
        server.start();
        System.out.println("Sistema Pericial de diagnóstico inicial a rodar na porta " + serverPort);
    }

    static class ObtainInitialQuiz implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            t.getResponseHeaders().add("Access-Control-Allow-Origin", "*");

            String response = quiz.generateInitialQuizString();
            t.sendResponseHeaders(200,response.getBytes().length);
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }

    static class ObtainInitialQuizResponse implements HttpHandler {
        @Override
        public void handle(HttpExchange t) throws IOException {
            t.getResponseHeaders().add("Access-Control-Allow-Origin", "*");

            InputStreamReader isr = new InputStreamReader(t.getRequestBody(), "utf-8");
            BufferedReader br = new BufferedReader(isr);
            StringBuilder buf = new StringBuilder();
            String line;
            while ((line = br.readLine()) != null) {
                buf.append(line);
                buf.append("\n");
            }
            br.close();
            isr.close();

            String answers = buf.toString();
            Reader.assignAnswersToQuiz(quiz,answers);
            AnxietyDiagnosis.runEngine(quiz);

            String response = AnxietyDiagnosis.initialConclusion.toString();
            t.sendResponseHeaders(200,response.getBytes().length);
            OutputStream os = t.getResponseBody();
            os.write(response.getBytes());
            os.close();
        }
    }
}