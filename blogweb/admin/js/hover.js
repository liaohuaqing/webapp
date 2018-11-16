// JavaScript Document
function showtable(tablename) {
  var color1 = "#F2FAFF";
  var color2 = "#F2FAFF";
  var bgColor = "#E4F7FF";
  var trs = document.getElementById(tablename).getElementsByTagName("tr");
  for (var i = 0; i < trs.length; i++) {
    if (i % 2 == 0) {
      trs[i].style.backgroundColor = color1;
      trs[i].onmouseover = function() {
        this.style.backgroundColor = bgColor;
      }
      trs[i].onmouseout = function() {
        this.style.backgroundColor = color1;
      }
    } else {
      trs[i].style.backgroundColor = color2;
      trs[i].onmouseover = function() {
        this.style.backgroundColor = bgColor;
      }
      trs[i].onmouseout = function() {
        this.style.backgroundColor = color2;
      }
    }
  }
}

function showtable2(tablename) {
  var color1 = "#EEF4FA";
  var color2 = "#FFFFFF";
  var bgColor = "#EEF5E3";
  var trs = document.getElementById(tablename).getElementsByTagName("tr");
  for (var i = 0; i < trs.length; i++) {
    if (i % 2 == 0) {
      trs[i].style.backgroundColor = color1;
      trs[i].onmouseover = function() {
        this.style.backgroundColor = bgColor;
      }
      trs[i].onmouseout = function() {
        this.style.backgroundColor = color1;
      }
    } else {
      trs[i].style.backgroundColor = color2;
      trs[i].onmouseover = function() {
        this.style.backgroundColor = bgColor;
      }
      trs[i].onmouseout = function() {
        this.style.backgroundColor = color2;
      }
    }
  }
}