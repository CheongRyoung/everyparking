// 주소 펼치기
function doShowAddress(target){
    var parkingSpot = target.closest(".parkingSpot");
    parkingSpot.querySelector(".addressInfo").classList.toggle("show");
}

const container = document.querySelector('.scroll-container');
const inner = document.querySelector('.inner');
const bbline = document.getElementById('bbline');
const navColor = document.querySelectorAll('.navColor');

let startPos = 0;
let offset = 0;
let curPos = 0;
const cnWidth = container.clientWidth;

window.addEventListener('DOMContentLoaded', e => {
    document.querySelector('body').classList.add('scrollNonBox')
})
// 이동이벤트
container.addEventListener('touchstart', (e) => {
    startPos = e.touches[0].pageX;  // 터치한 x 좌표
});

container.addEventListener('touchmove', (e) => {
    inner.style.transitionDuration = '0ms';
    offset = curPos + (e.targetTouches[0].pageX - startPos); // 이동중인 x좌표
    inner.style.transform = `translate3d(${offset}px, 0px, 0px)`;
    bbline.style.transform = `translate3d(${-offset/3}px, 0px, 0px)`;
});

container.addEventListener('touchend', (e) => {
    const sum = curPos + (e.changedTouches[0].pageX - startPos); //바낀 x좌표
    let finalX = Math.round(sum / cnWidth) * cnWidth;
    clearColor();
    // 0은 첫단 영역의 시작이다  이동될 수록 -
    if (finalX >= 0) {
        finalX = 0;
        navColor[0].classList.add("activeBox");
    }

    // 끝단 영역보다 더 작으면 끝단으로
    else if (finalX <= -(cnWidth * (3 - 1))) {
        finalX = -(cnWidth * (3 - 1));
        navColor[2].classList.add("activeBox");
    } else {
        navColor[1].classList.add("activeBox");
    }

    inner.style.transform = `translate3d(${finalX}px, 0px, 0px)`;
    bbline.style.transform = `translate3d(${-finalX/3}px, 0px, 0px)`;
    inner.style.transitionDuration = '300ms';
    bbline.style.transitionDuration = '300ms';
    curPos = finalX;
    
    list.tabChangeEvent();
});

function clearColor() {
    navColor.forEach(e => {
        e.classList.remove("activeBox");
    })
}
// 클릭이벤트
navColor.forEach(e => {
    e.addEventListener('click', (e) => {
        let index = 0;
        if(e.pageX < cnWidth/3) {
            index = 1;
        } else if(e.pageX < cnWidth/3*2) {
            index = 2;
        } else {
            index = 3;
        }
        let finalX = (-cnWidth * (index - 1))
        clearColor()
        navColor[index-1].classList.add("activeBox");
        inner.style.transform = `translate3d(${finalX}px, 0px, 0px)`;
        bbline.style.transform = `translate3d(${-finalX/3}px, 0px, 0px)`;
        inner.style.transitionDuration = '300ms';
        bbline.style.transitionDuration = '300ms';
        curPos = finalX;
        
        list.tabChangeEvent();
    })
})