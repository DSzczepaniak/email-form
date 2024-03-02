let message = document.getElementById("message");
let counter = document.getElementById("counterChars");
let maxChars = document.getElementById("maxChars");
let maxlengthTextarea = message.getAttribute("maxlength");

function insertTextToTextarea(text) {
    let cursorPos = message.selectionStart;
    let textBeforeCursor = message.value.substring(0, cursorPos);
    let textAfterCursor = message.value.substring(cursorPos);
    let newText = textBeforeCursor + text + textAfterCursor;

    if (newText.length <= maxlengthTextarea) {
        message.value = newText;
        updateCounter();
    } else {
        alert("You have reached the maximum character limit!");
    }
}

message.addEventListener("input", updateCounter);

function updateCounter() {
    counter.textContent = message.value.length;
}

maxChars.textContent = maxlengthTextarea;
message.placeholder = "Write message (max. " + maxlengthTextarea + " characters)";