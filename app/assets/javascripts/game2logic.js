$(document).ready(function () {

    var questionNumber=0;

    //Set
    var questions = document.getElementById("questions").value.replace(/=>/g, ":");
    var cheto = '{["questions" : "'+ questions.slice(1,questions.length) +"]}";

   var quizlist= JSON.parse(questions);
//    var questions1= questions.parseJSON();
//    var testStringJSON = ""
    var questionBank=new Array();
    var numberOfQuestions;
    var score=0;

    for(i=0;i<quizlist.length;i++){
        questionBank[i]=new Array;
        questionBank[i][0]=quizlist[i].question;
        questionBank[i][1]=quizlist[i].answer;
        questionBank[i][2]=quizlist[i].url;
    }

    numberOfQuestions=questionBank.length;
    displayQuestion();


    $("#next").click(function (){
        var answer = $('#answerInput').val().toLowerCase();
        alertify.set({ delay: 2000 });

        if(answer === (questionBank[questionNumber][1]).toLowerCase()){
            alertify.success("Correcto!");
            score++;
        }else{
            alertify.error("Incorrecto!");
        }

        document.getElementById("score").value = score;

        setTimeout(function(){
            questionNumber++;
            displayQuestion();
        },10000);

    });


    function displayQuestion(){
        $(".question h1").text(questionBank[questionNumber][0]);
        $("#question_image").attr("src",questionBank[questionNumber][2]);
        $("#answerInput").val("");
    }//display question


    $('#')
});//doc ready

function clickLast(){
    document.getElementById("submitBt").click();
}


