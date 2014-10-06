



$(document).ready(function () {


    var questionNumber=0;
    var questionBank=new Array();
    var numberOfQuestions;
    var score=0;

    $('#check').click(function(){

    });

    $("#next").click(function (){
        var answer = $('#answerInput').val().toLowerCase();
        //correct answer
        if(answer === (questionBank[questionNumber][2]).toLowerCase()){
            score++;
        }

        setTimeout(function(){changeQuestion()},1000);
        questionNumber++;
        displayQuestion();
    });


    $.getJSON('http://localhost:3000/assets/questions.json', function(data) {

        for(i=0;i<data.questions.length;i++){
            questionBank[i]=new Array;
            questionBank[i][0]=data.questions[i].question;
            questionBank[i][1]=data.questions[i].image;
            questionBank[i][2]=data.questions[i].answer;
        }

        numberOfQuestions=questionBank.length;
        displayQuestion();
    })//gtjson

    function displayQuestion(){
        $(".question h1").text(questionBank[questionNumber][0]);
        $("#question_image").attr("src",questionBank[questionNumber][1]);
        $("#answerInput").val("");
    }//display question


    function displayFinalSlide(){
        $(stage).append('<div class="questionText">You have finished the quiz!<br><br>Total questions: '+numberOfQuestions+'<br>Correct answers: '+score+'</div>');
    }//display final slide

});//doc ready