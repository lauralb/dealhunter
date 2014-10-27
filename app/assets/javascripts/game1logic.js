$(document).ready(function () {

    var questionNumber=0;

    //Set
    var questions = document.getElementById("questions").value.replace(/=>/g, ":");
    //questions = questions.replace("/n", "");

    var cheto = '{["questions" : "'+ questions.slice(1,questions.length) +"]}";

    var questionList= JSON.parse(questions);
    //var questionList = questions;

    var questionBank=new Array();

    var numberOfQuestions=0;
    var score=0;
    var selected="";



    for(i=0;i<questionList.length;i++){
        var nums = shuffle([1,2,3,4]);
        questionBank[i]=new Array;
        questionBank[i][0]=questionList[i].question;
        questionBank[i][nums[0]]=questionList[i].answer1;
        questionBank[i][nums[1]]=questionList[i].answer2;
        questionBank[i][nums[2]]=questionList[i].answer3;
        questionBank[i][nums[3]]=questionList[i].correct_answer;
        questionBank[i][5]=questionList[i].correct_answer;
    }

    for(i=0;i<questionList.length;i++){
       console.log(questionList[i][0]) ;
    }

    numberOfQuestions=questionBank.length;
    displayQuestion();


    $("#next").click(function (){
        alertify.set({ delay: 2000 });

        var correct = questionBank[questionNumber][5];

        if(correct === selected){
            alertify.success("Correcto!");
            score++;
        }else{
            alertify.error("Incorrecto!");
        }

        document.getElementById("score").value = score;

        setTimeout(function(){
            questionNumber++;
            displayQuestion();
        },1000);

    });

    $("input").click(function (){
        selected = $(this).val();
    });


    function displayQuestion(){
        if(questionNumber == 5) clickLast();
        $("#question").text(questionBank[questionNumber][0]);
        $("#rta1").text(questionBank[questionNumber][1]);
        $("#ans1").val(questionBank[questionNumber][1]);
        $("#rta2").text(questionBank[questionNumber][2]);
        $("#ans2").val(questionBank[questionNumber][2]);
        $("#rta3").text(questionBank[questionNumber][3]);
        $("#ans3").val(questionBank[questionNumber][3]);
        $("#rta4").text(questionBank[questionNumber][4]);
        $("#ans4").val(questionBank[questionNumber][4]);
        $("#ans0").click();
    }//display question


});//doc ready


function clickLast(){
    document.getElementById("submitBt").click();
}


function shuffle(array) {
    var currentIndex = array.length, temporaryValue, randomIndex ;
    while (0 !== currentIndex) {
        randomIndex = Math.floor(Math.random() * currentIndex);
        currentIndex -= 1;
        temporaryValue = array[currentIndex];
        array[currentIndex] = array[randomIndex];
        array[randomIndex] = temporaryValue;
    }

    return array;
}


