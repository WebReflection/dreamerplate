(function(s,O,S){
  switch(true){
    case !window.JSON:s.push('json2.js');
    case !s.forEach:s.push('es5-shim.js');
    case !O.create:s.push('es5-sham.js');
    case !O.bind:s.push('Function.bind.js');
    case !''.trim:s.push('String.trim.js');
  } while(s.length) {
    S.parentNode.insertBefore(
      document.createElement('script'),S
    ).src='js-env/'+s.shift();
  }
}([],Object,document.getElementsByTagName('script')[0]));