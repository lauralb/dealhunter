var seconds = 0;

setInterval(function(){updateTimer()}, 1000);

function updateTimer(){
    seconds += 1;
    document.getElementById("timer-minutes").innerHTML = formatTime(parseInt(seconds/60));
    document.getElementById("timer-seconds").innerHTML = formatTime(seconds%60);
}

function formatTime(time){
    var timeString = time.toString();
    if(timeString.length < 2){
        return "0" + timeString;
    } else {
        return timeString;
    }

}