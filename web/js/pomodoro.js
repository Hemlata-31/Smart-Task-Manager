let timer;
let minutes = 25;
let seconds = 0;
let isWorkMode = true;
let isPaused = true;

const display = document.getElementById('timer-display');
const modeText = document.getElementById('mode-text');

function updateDisplay() {
    let m = minutes < 10 ? '0' + minutes : minutes;
    let s = seconds < 10 ? '0' + seconds : seconds;
    display.textContent = `${m}:${s}`;
}

function startTimer() {
    if (!isPaused) return;
    isPaused = false;
    timer = setInterval(() => {
        if (seconds === 0) {
            if (minutes === 0) {
                clearInterval(timer);
                alert(isWorkMode ? 'Work session over! Take a break.' : 'Break over! Back to work.');
                toggleMode();
                return;
            }
            minutes--;
            seconds = 59;
        } else {
            seconds--;
        }
        updateDisplay();
    }, 1000);
}

function pauseTimer() {
    isPaused = true;
    clearInterval(timer);
}

function resetTimer() {
    pauseTimer();
    minutes = isWorkMode ? 25 : 5;
    seconds = 0;
    updateDisplay();
}

function toggleMode() {
    isWorkMode = !isWorkMode;
    minutes = isWorkMode ? 25 : 5;
    seconds = 0;
    modeText.textContent = isWorkMode ? 'Work Mode (25m)' : 'Break Mode (5m)';
    updateDisplay();
    isPaused = true;
}

updateDisplay();
