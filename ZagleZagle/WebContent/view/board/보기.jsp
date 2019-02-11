<html class="wf-notosanskr-n4-active wf-active" lang="ko"><head>
  <meta http-equiv="X-UA-Compatible" content="IE=Edge">
<script type="text/javascript" src="https://bam.nr-data.net/1/7289017309?a=15650448&amp;v=1118.0c07c19&amp;to=d1xaFhBeWVoEQhdRClpHUQwWQhpVAEJcbQZbX1gHAUVcWQ9DF0ENW0Q%3D&amp;rst=927&amp;ref=https://ohou.se/contents/card_collections/439435&amp;ap=70&amp;be=242&amp;fe=912&amp;dc=389&amp;af=err,xhr,stn,ins&amp;perf=%7B%22timing%22:%7B%22of%22:1549872062322,%22n%22:0,%22u%22:227,%22r%22:4,%22ue%22:227,%22re%22:139,%22f%22:139,%22dn%22:139,%22dne%22:139,%22c%22:139,%22ce%22:139,%22rq%22:140,%22rp%22:222,%22rpe%22:224,%22dl%22:230,%22di%22:389,%22ds%22:389,%22de%22:410,%22dc%22:911,%22l%22:911,%22le%22:912%7D,%22navigation%22:%7B%22rc%22:2%7D%7D&amp;jsonp=NREUM.setToken"></script><script src="https://js-agent.newrelic.com/nr-1118.min.js"></script><script type="text/javascript" async="" src="https://cdn.amplitude.com/libs/amplitude-4.2.1-min.gz.js"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/gtm/js?id=GTM-54TVLXQ&amp;t=gtm3&amp;cid=1455921659.1549868506"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/plugins/ua/ec.js"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script type="text/javascript" async="" src="https://www.google-analytics.com/analytics.js"></script><script src="https://connect.facebook.net/signals/config/937204509645248?v=2.8.40&amp;r=stable" async=""></script><script async="" src="https://connect.facebook.net/en_US/fbevents.js"></script><script async="" src="https://www.googletagmanager.com/gtm.js?id=GTM-MK8DN2Q"></script><script type="text/javascript">window.NREUM||(NREUM={});NREUM.info={"beacon":"bam.nr-data.net","errorBeacon":"bam.nr-data.net","licenseKey":"7289017309","applicationID":"15650448","transactionName":"d1xaFhBeWVoEQhdRClpHUQwWQhpVAEJcbQZbX1gHAUVcWQ9DF0ENW0Q=","queueTime":0,"applicationTime":70,"agent":""}</script>
<script type="text/javascript">(window.NREUM||(NREUM={})).loader_config={xpid:"VQUHVVZQChABUVdXBwUDXg=="};window.NREUM||(NREUM={}),__nr_require=function(t,n,e){function r(e){if(!n[e]){var o=n[e]={exports:{}};t[e][0].call(o.exports,function(n){var o=t[e][1][n];return r(o||n)},o,o.exports)}return n[e].exports}if("function"==typeof __nr_require)return __nr_require;for(var o=0;o<e.length;o++)r(e[o]);return r}({1:[function(t,n,e){function r(t){try{s.console&&console.log(t)}catch(n){}}var o,i=t("ee"),a=t(16),s={};try{o=localStorage.getItem("__nr_flags").split(","),console&&"function"==typeof console.log&&(s.console=!0,o.indexOf("dev")!==-1&&(s.dev=!0),o.indexOf("nr_dev")!==-1&&(s.nrDev=!0))}catch(c){}s.nrDev&&i.on("internal-error",function(t){r(t.stack)}),s.dev&&i.on("fn-err",function(t,n,e){r(e.stack)}),s.dev&&(r("NR AGENT IN DEVELOPMENT MODE"),r("flags: "+a(s,function(t,n){return t}).join(", ")))},{}],2:[function(t,n,e){function r(t,n,e,r,s){try{p?p-=1:o(s||new UncaughtException(t,n,e),!0)}catch(f){try{i("ierr",[f,c.now(),!0])}catch(d){}}return"function"==typeof u&&u.apply(this,a(arguments))}function UncaughtException(t,n,e){this.message=t||"Uncaught error with no additional information",this.sourceURL=n,this.line=e}function o(t,n){var e=n?null:c.now();i("err",[t,e])}var i=t("handle"),a=t(17),s=t("ee"),c=t("loader"),f=t("gos"),u=window.onerror,d=!1,l="nr@seenError",p=0;c.features.err=!0,t(1),window.onerror=r;try{throw new Error}catch(h){"stack"in h&&(t(8),t(7),"addEventListener"in window&&t(5),c.xhrWrappable&&t(9),d=!0)}s.on("fn-start",function(t,n,e){d&&(p+=1)}),s.on("fn-err",function(t,n,e){d&&!e[l]&&(f(e,l,function(){return!0}),this.thrown=!0,o(e))}),s.on("fn-end",function(){d&&!this.thrown&&p>0&&(p-=1)}),s.on("internal-error",function(t){i("ierr",[t,c.now(),!0])})},{}],3:[function(t,n,e){t("loader").features.ins=!0},{}],4:[function(t,n,e){function r(t){}if(window.performance&&window.performance.timing&&window.performance.getEntriesByType){var o=t("ee"),i=t("handle"),a=t(8),s=t(7),c="learResourceTimings",f="addEventListener",u="resourcetimingbufferfull",d="bstResource",l="resource",p="-start",h="-end",m="fn"+p,v="fn"+h,w="bstTimer",y="pushState",g=t("loader");g.features.stn=!0,t(6);var b=NREUM.o.EV;o.on(m,function(t,n){var e=t[0];e instanceof b&&(this.bstStart=g.now())}),o.on(v,function(t,n){var e=t[0];e instanceof b&&i("bst",[e,n,this.bstStart,g.now()])}),a.on(m,function(t,n,e){this.bstStart=g.now(),this.bstType=e}),a.on(v,function(t,n){i(w,[n,this.bstStart,g.now(),this.bstType])}),s.on(m,function(){this.bstStart=g.now()}),s.on(v,function(t,n){i(w,[n,this.bstStart,g.now(),"requestAnimationFrame"])}),o.on(y+p,function(t){this.time=g.now(),this.startPath=location.pathname+location.hash}),o.on(y+h,function(t){i("bstHist",[location.pathname+location.hash,this.startPath,this.time])}),f in window.performance&&(window.performance["c"+c]?window.performance[f](u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["c"+c]()},!1):window.performance[f]("webkit"+u,function(t){i(d,[window.performance.getEntriesByType(l)]),window.performance["webkitC"+c]()},!1)),document[f]("scroll",r,{passive:!0}),document[f]("keypress",r,!1),document[f]("click",r,!1)}},{}],5:[function(t,n,e){function r(t){for(var n=t;n&&!n.hasOwnProperty(u);)n=Object.getPrototypeOf(n);n&&o(n)}function o(t){s.inPlace(t,[u,d],"-",i)}function i(t,n){return t[1]}var a=t("ee").get("events"),s=t(19)(a,!0),c=t("gos"),f=XMLHttpRequest,u="addEventListener",d="removeEventListener";n.exports=a,"getPrototypeOf"in Object?(r(document),r(window),r(f.prototype)):f.prototype.hasOwnProperty(u)&&(o(window),o(f.prototype)),a.on(u+"-start",function(t,n){var e=t[1],r=c(e,"nr@wrapped",function(){function t(){if("function"==typeof e.handleEvent)return e.handleEvent.apply(e,arguments)}var n={object:t,"function":e}[typeof e];return n?s(n,"fn-",null,n.name||"anonymous"):e});this.wrapped=t[1]=r}),a.on(d+"-start",function(t){t[1]=this.wrapped||t[1]})},{}],6:[function(t,n,e){var r=t("ee").get("history"),o=t(19)(r);n.exports=r,o.inPlace(window.history,["pushState","replaceState"],"-")},{}],7:[function(t,n,e){var r=t("ee").get("raf"),o=t(19)(r),i="equestAnimationFrame";n.exports=r,o.inPlace(window,["r"+i,"mozR"+i,"webkitR"+i,"msR"+i],"raf-"),r.on("raf-start",function(t){t[0]=o(t[0],"fn-")})},{}],8:[function(t,n,e){function r(t,n,e){t[0]=a(t[0],"fn-",null,e)}function o(t,n,e){this.method=e,this.timerDuration=isNaN(t[1])?0:+t[1],t[0]=a(t[0],"fn-",this,e)}var i=t("ee").get("timer"),a=t(19)(i),s="setTimeout",c="setInterval",f="clearTimeout",u="-start",d="-";n.exports=i,a.inPlace(window,[s,"setImmediate"],s+d),a.inPlace(window,[c],c+d),a.inPlace(window,[f,"clearImmediate"],f+d),i.on(c+u,r),i.on(s+u,o)},{}],9:[function(t,n,e){function r(t,n){d.inPlace(n,["onreadystatechange"],"fn-",s)}function o(){var t=this,n=u.context(t);t.readyState>3&&!n.resolved&&(n.resolved=!0,u.emit("xhr-resolved",[],t)),d.inPlace(t,y,"fn-",s)}function i(t){g.push(t),h&&(x?x.then(a):v?v(a):(E=-E,O.data=E))}function a(){for(var t=0;t<g.length;t++)r([],g[t]);g.length&&(g=[])}function s(t,n){return n}function c(t,n){for(var e in t)n[e]=t[e];return n}t(5);var f=t("ee"),u=f.get("xhr"),d=t(19)(u),l=NREUM.o,p=l.XHR,h=l.MO,m=l.PR,v=l.SI,w="readystatechange",y=["onload","onerror","onabort","onloadstart","onloadend","onprogress","ontimeout"],g=[];n.exports=u;var b=window.XMLHttpRequest=function(t){var n=new p(t);try{u.emit("new-xhr",[n],n),n.addEventListener(w,o,!1)}catch(e){try{u.emit("internal-error",[e])}catch(r){}}return n};if(c(p,b),b.prototype=p.prototype,d.inPlace(b.prototype,["open","send"],"-xhr-",s),u.on("send-xhr-start",function(t,n){r(t,n),i(n)}),u.on("open-xhr-start",r),h){var x=m&&m.resolve();if(!v&&!m){var E=1,O=document.createTextNode(E);new h(a).observe(O,{characterData:!0})}}else f.on("fn-end",function(t){t[0]&&t[0].type===w||a()})},{}],10:[function(t,n,e){function r(t){var n=this.params,e=this.metrics;if(!this.ended){this.ended=!0;for(var r=0;r<d;r++)t.removeEventListener(u[r],this.listener,!1);if(!n.aborted){if(e.duration=a.now()-this.startTime,4===t.readyState){n.status=t.status;var i=o(t,this.lastSize);if(i&&(e.rxSize=i),this.sameOrigin){var c=t.getResponseHeader("X-NewRelic-App-Data");c&&(n.cat=c.split(", ").pop())}}else n.status=0;e.cbTime=this.cbTime,f.emit("xhr-done",[t],t),s("xhr",[n,e,this.startTime])}}}function o(t,n){var e=t.responseType;if("json"===e&&null!==n)return n;var r="arraybuffer"===e||"blob"===e||"json"===e?t.response:t.responseText;return h(r)}function i(t,n){var e=c(n),r=t.params;r.host=e.hostname+":"+e.port,r.pathname=e.pathname,t.sameOrigin=e.sameOrigin}var a=t("loader");if(a.xhrWrappable){var s=t("handle"),c=t(11),f=t("ee"),u=["load","error","abort","timeout"],d=u.length,l=t("id"),p=t(14),h=t(13),m=window.XMLHttpRequest;a.features.xhr=!0,t(9),f.on("new-xhr",function(t){var n=this;n.totalCbs=0,n.called=0,n.cbTime=0,n.end=r,n.ended=!1,n.xhrGuids={},n.lastSize=null,p&&(p>34||p<10)||window.opera||t.addEventListener("progress",function(t){n.lastSize=t.loaded},!1)}),f.on("open-xhr-start",function(t){this.params={method:t[0]},i(this,t[1]),this.metrics={}}),f.on("open-xhr-end",function(t,n){"loader_config"in NREUM&&"xpid"in NREUM.loader_config&&this.sameOrigin&&n.setRequestHeader("X-NewRelic-ID",NREUM.loader_config.xpid)}),f.on("send-xhr-start",function(t,n){var e=this.metrics,r=t[0],o=this;if(e&&r){var i=h(r);i&&(e.txSize=i)}this.startTime=a.now(),this.listener=function(t){try{"abort"===t.type&&(o.params.aborted=!0),("load"!==t.type||o.called===o.totalCbs&&(o.onloadCalled||"function"!=typeof n.onload))&&o.end(n)}catch(e){try{f.emit("internal-error",[e])}catch(r){}}};for(var s=0;s<d;s++)n.addEventListener(u[s],this.listener,!1)}),f.on("xhr-cb-time",function(t,n,e){this.cbTime+=t,n?this.onloadCalled=!0:this.called+=1,this.called!==this.totalCbs||!this.onloadCalled&&"function"==typeof e.onload||this.end(e)}),f.on("xhr-load-added",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&!this.xhrGuids[e]&&(this.xhrGuids[e]=!0,this.totalCbs+=1)}),f.on("xhr-load-removed",function(t,n){var e=""+l(t)+!!n;this.xhrGuids&&this.xhrGuids[e]&&(delete this.xhrGuids[e],this.totalCbs-=1)}),f.on("addEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-added",[t[1],t[2]],n)}),f.on("removeEventListener-end",function(t,n){n instanceof m&&"load"===t[0]&&f.emit("xhr-load-removed",[t[1],t[2]],n)}),f.on("fn-start",function(t,n,e){n instanceof m&&("onload"===e&&(this.onload=!0),("load"===(t[0]&&t[0].type)||this.onload)&&(this.xhrCbStart=a.now()))}),f.on("fn-end",function(t,n){this.xhrCbStart&&f.emit("xhr-cb-time",[a.now()-this.xhrCbStart,this.onload,n],n)})}},{}],11:[function(t,n,e){n.exports=function(t){var n=document.createElement("a"),e=window.location,r={};n.href=t,r.port=n.port;var o=n.href.split("://");!r.port&&o[1]&&(r.port=o[1].split("/")[0].split("@").pop().split(":")[1]),r.port&&"0"!==r.port||(r.port="https"===o[0]?"443":"80"),r.hostname=n.hostname||e.hostname,r.pathname=n.pathname,r.protocol=o[0],"/"!==r.pathname.charAt(0)&&(r.pathname="/"+r.pathname);var i=!n.protocol||":"===n.protocol||n.protocol===e.protocol,a=n.hostname===document.domain&&n.port===e.port;return r.sameOrigin=i&&(!n.hostname||a),r}},{}],12:[function(t,n,e){function r(){}function o(t,n,e){return function(){return i(t,[f.now()].concat(s(arguments)),n?null:this,e),n?void 0:this}}var i=t("handle"),a=t(16),s=t(17),c=t("ee").get("tracer"),f=t("loader"),u=NREUM;"undefined"==typeof window.newrelic&&(newrelic=u);var d=["setPageViewName","setCustomAttribute","setErrorHandler","finished","addToTrace","inlineHit","addRelease"],l="api-",p=l+"ixn-";a(d,function(t,n){u[n]=o(l+n,!0,"api")}),u.addPageAction=o(l+"addPageAction",!0),u.setCurrentRouteName=o(l+"routeName",!0),n.exports=newrelic,u.interaction=function(){return(new r).get()};var h=r.prototype={createTracer:function(t,n){var e={},r=this,o="function"==typeof n;return i(p+"tracer",[f.now(),t,e],r),function(){if(c.emit((o?"":"no-")+"fn-start",[f.now(),r,o],e),o)try{return n.apply(this,arguments)}catch(t){throw c.emit("fn-err",[arguments,this,t],e),t}finally{c.emit("fn-end",[f.now()],e)}}}};a("actionText,setName,setAttribute,save,ignore,onEnd,getContext,end,get".split(","),function(t,n){h[n]=o(p+n)}),newrelic.noticeError=function(t,n){"string"==typeof t&&(t=new Error(t)),i("err",[t,f.now(),!1,n])}},{}],13:[function(t,n,e){n.exports=function(t){if("string"==typeof t&&t.length)return t.length;if("object"==typeof t){if("undefined"!=typeof ArrayBuffer&&t instanceof ArrayBuffer&&t.byteLength)return t.byteLength;if("undefined"!=typeof Blob&&t instanceof Blob&&t.size)return t.size;if(!("undefined"!=typeof FormData&&t instanceof FormData))try{return JSON.stringify(t).length}catch(n){return}}}},{}],14:[function(t,n,e){var r=0,o=navigator.userAgent.match(/Firefox[\/\s](\d+\.\d+)/);o&&(r=+o[1]),n.exports=r},{}],15:[function(t,n,e){function r(t,n){if(!o)return!1;if(t!==o)return!1;if(!n)return!0;if(!i)return!1;for(var e=i.split("."),r=n.split("."),a=0;a<r.length;a++)if(r[a]!==e[a])return!1;return!0}var o=null,i=null,a=/Version\/(\S+)\s+Safari/;if(navigator.userAgent){var s=navigator.userAgent,c=s.match(a);c&&s.indexOf("Chrome")===-1&&s.indexOf("Chromium")===-1&&(o="Safari",i=c[1])}n.exports={agent:o,version:i,match:r}},{}],16:[function(t,n,e){function r(t,n){var e=[],r="",i=0;for(r in t)o.call(t,r)&&(e[i]=n(r,t[r]),i+=1);return e}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],17:[function(t,n,e){function r(t,n,e){n||(n=0),"undefined"==typeof e&&(e=t?t.length:0);for(var r=-1,o=e-n||0,i=Array(o<0?0:o);++r<o;)i[r]=t[n+r];return i}n.exports=r},{}],18:[function(t,n,e){n.exports={exists:"undefined"!=typeof window.performance&&window.performance.timing&&"undefined"!=typeof window.performance.timing.navigationStart}},{}],19:[function(t,n,e){function r(t){return!(t&&t instanceof Function&&t.apply&&!t[a])}var o=t("ee"),i=t(17),a="nr@original",s=Object.prototype.hasOwnProperty,c=!1;n.exports=function(t,n){function e(t,n,e,o){function nrWrapper(){var r,a,s,c;try{a=this,r=i(arguments),s="function"==typeof e?e(r,a):e||{}}catch(f){l([f,"",[r,a,o],s])}u(n+"start",[r,a,o],s);try{return c=t.apply(a,r)}catch(d){throw u(n+"err",[r,a,d],s),d}finally{u(n+"end",[r,a,c],s)}}return r(t)?t:(n||(n=""),nrWrapper[a]=t,d(t,nrWrapper),nrWrapper)}function f(t,n,o,i){o||(o="");var a,s,c,f="-"===o.charAt(0);for(c=0;c<n.length;c++)s=n[c],a=t[s],r(a)||(t[s]=e(a,f?s+o:o,i,s))}function u(e,r,o){if(!c||n){var i=c;c=!0;try{t.emit(e,r,o,n)}catch(a){l([a,e,r,o])}c=i}}function d(t,n){if(Object.defineProperty&&Object.keys)try{var e=Object.keys(t);return e.forEach(function(e){Object.defineProperty(n,e,{get:function(){return t[e]},set:function(n){return t[e]=n,n}})}),n}catch(r){l([r])}for(var o in t)s.call(t,o)&&(n[o]=t[o]);return n}function l(n){try{t.emit("internal-error",n)}catch(e){}}return t||(t=o),e.inPlace=f,e.flag=a,e}},{}],ee:[function(t,n,e){function r(){}function o(t){function n(t){return t&&t instanceof r?t:t?c(t,s,i):i()}function e(e,r,o,i){if(!l.aborted||i){t&&t(e,r,o);for(var a=n(o),s=m(e),c=s.length,f=0;f<c;f++)s[f].apply(a,r);var d=u[g[e]];return d&&d.push([b,e,r,a]),a}}function p(t,n){y[t]=m(t).concat(n)}function h(t,n){var e=y[t];if(e)for(var r=0;r<e.length;r++)e[r]===n&&e.splice(r,1)}function m(t){return y[t]||[]}function v(t){return d[t]=d[t]||o(e)}function w(t,n){f(t,function(t,e){n=n||"feature",g[e]=n,n in u||(u[n]=[])})}var y={},g={},b={on:p,addEventListener:p,removeEventListener:h,emit:e,get:v,listeners:m,context:n,buffer:w,abort:a,aborted:!1};return b}function i(){return new r}function a(){(u.api||u.feature)&&(l.aborted=!0,u=l.backlog={})}var s="nr@context",c=t("gos"),f=t(16),u={},d={},l=n.exports=o();l.backlog=u},{}],gos:[function(t,n,e){function r(t,n,e){if(o.call(t,n))return t[n];var r=e();if(Object.defineProperty&&Object.keys)try{return Object.defineProperty(t,n,{value:r,writable:!0,enumerable:!1}),r}catch(i){}return t[n]=r,r}var o=Object.prototype.hasOwnProperty;n.exports=r},{}],handle:[function(t,n,e){function r(t,n,e,r){o.buffer([t],r),o.emit(t,n,e)}var o=t("ee").get("handle");n.exports=r,r.ee=o},{}],id:[function(t,n,e){function r(t){var n=typeof t;return!t||"object"!==n&&"function"!==n?-1:t===window?0:a(t,i,function(){return o++})}var o=1,i="nr@id",a=t("gos");n.exports=r},{}],loader:[function(t,n,e){function r(){if(!E++){var t=x.info=NREUM.info,n=p.getElementsByTagName("script")[0];if(setTimeout(u.abort,3e4),!(t&&t.licenseKey&&t.applicationID&&n))return u.abort();f(g,function(n,e){t[n]||(t[n]=e)}),c("mark",["onload",a()+x.offset],null,"api");var e=p.createElement("script");e.src="https://"+t.agent,n.parentNode.insertBefore(e,n)}}function o(){"complete"===p.readyState&&i()}function i(){c("mark",["domContent",a()+x.offset],null,"api")}function a(){return O.exists&&performance.now?Math.round(performance.now()):(s=Math.max((new Date).getTime(),s))-x.offset}var s=(new Date).getTime(),c=t("handle"),f=t(16),u=t("ee"),d=t(15),l=window,p=l.document,h="addEventListener",m="attachEvent",v=l.XMLHttpRequest,w=v&&v.prototype;NREUM.o={ST:setTimeout,SI:l.setImmediate,CT:clearTimeout,XHR:v,REQ:l.Request,EV:l.Event,PR:l.Promise,MO:l.MutationObserver};var y=""+location,g={beacon:"bam.nr-data.net",errorBeacon:"bam.nr-data.net",agent:"js-agent.newrelic.com/nr-1118.min.js"},b=v&&w&&w[h]&&!/CriOS/.test(navigator.userAgent),x=n.exports={offset:s,now:a,origin:y,features:{},xhrWrappable:b,userAgent:d};t(12),p[h]?(p[h]("DOMContentLoaded",i,!1),l[h]("load",r,!1)):(p[m]("onreadystatechange",o),l[m]("onload",r)),c("mark",["firstbyte",s],null,"api");var E=0,O=t(18)},{}]},{},["loader",2,10,4,3]);</script>
  <meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0">
  <meta name="naver-site-verification" content="02b1a3c42ca24420bada54291813fdd604872c89">
  <meta property="fb:admins" content="100006457426639">
    <meta name="google-site-verification" content="d-veBobRNo_in0thN3uOOoIcUWMUOjQZeMidTyItfGk">
    <meta name="google-site-verification" content="AZK3GfRwg4q_EH-0OSbbkCurocEY7okWrPZF93COxYU">

  <title>ivory726님의 인테리어 사진 | 오늘의집 유저들의 집꾸미기</title>
  <meta name="description" content="ivory726님의 예쁜 집 꾸미기 팁, &quot;&quot;">
  <!-- og tags -->
    <!-- FACEBOOK DATA -->
<meta property="og:title" content="ivory726님의 인테리어 사진 | 오늘의집">
<meta property="og:type" content="website">
<meta property="og:url" content="ohou.se/contents/card_collections/439435">
<meta property="og:image" content="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots-1549872034643_kyINb.jpg/1700/1700">
<meta property="og:description" content="">
<meta property="og:width" content="300">
<meta property="og:height" content="300">
<meta property="fb:app_id" content="185853321610795">

<!-- Google+ DATA -->
<meta itemprop="name" content="ivory726님의 인테리어 사진 | 오늘의집">
<meta itemprop="description" content="">
<meta itemprop="image" content="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-snapshots-1549872034643_kyINb.jpg/1700/1700">

  <!---->

  <!-- phone 즐겨찾기 아이콘 설정 -->
  <link rel="alternate" href="android-app://net.bucketplace/http/ohou.se/deep">
  <link rel="apple-touch-icon" sizes="57x57" href="/assets/bookmark_icon/favicon_57x57.png">
  <link rel="apple-touch-icon" sizes="72x72" href="/assets/bookmark_icon/favicon_72x72.png">
  <link rel="apple-touch-icon" sizes="114x114" href="/assets/bookmark_icon/favicon_114x114.png">
  <link rel="apple-touch-icon" sizes="144x144" href="/assets/bookmark_icon/favicon_144x144.png">
  <link rel="shortcut icon" href="/assets/bookmark_icon/favicon_144x144.png">
  <link href="https://d1nyaccf3kuclt.cloudfront.net/assets/favicon-313972e6d20bf2329ff78c43fdd342b24cb985f98af735a7cca4642b82b8bf4a.png" rel="shortcut icon">

    <script>
      dataLayer = [{
        'userID': 764692,
        'userCreateDate': 2017-02-24,
        'userCreateWeek': 159,
        'userCreatedMonth': 2017-02
      }];
      (function (w, d, s, l, i) {
        w[l] = w[l] || [];
        w[l].push({
          'gtm.start': new Date().getTime(), event: 'gtm.js'
        });
        var f = d.getElementsByTagName(s)[0],
          j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : '';
        j.async = true;
        j.src =
          'https://www.googletagmanager.com/gtm.js?id=' + i + dl;
        f.parentNode.insertBefore(j, f);
      })(window, document, 'script', 'dataLayer', 'GTM-MK8DN2Q');
    </script>

    <script>
      !function (f, b, e, v, n, t, s) {
        if (f.fbq) return;
        n = f.fbq = function () {
          n.callMethod ?
            n.callMethod.apply(n, arguments) : n.queue.push(arguments);
        };
        if (!f._fbq) f._fbq = n;
        n.push = n;
        n.loaded = !0;
        n.version = '2.0';
        n.queue = [];
        t = b.createElement(e);
        t.async = !0;
        t.src = v;
        s = b.getElementsByTagName(e)[0];
        s.parentNode.insertBefore(t, s);
      }(window,
        document, 'script', 'https://connect.facebook.net/en_US/fbevents.js');

      fbq('init', '937204509645248');
      fbq('track', 'PageView');
    </script>
    <noscript><img height="1" width="1" style="display:none"
                   src="https://www.facebook.com/tr?id=937204509645248&ev=PageView&noscript=1"
      /></noscript>

  <script src="//ajax.googleapis.com/ajax/libs/webfont/1/webfont.js"></script>
  <link rel="stylesheet" href="https://fonts.googleapis.com/earlyaccess/notosanskr.css" media="all"><script type="text/javascript">
    WebFont.load({
      // For early access or custom font
      custom: {
        families: ['Noto Sans KR'],
        urls: ['https://fonts.googleapis.com/earlyaccess/notosanskr.css']
      }
    });
  </script>

  <meta name="csrf-param" content="authenticity_token">
<meta name="csrf-token" content="rbjFIYVGq53/K8zXNymIuvOvsyuXi6sV0RsLf0u0yg79N34sh9/NC5nqiY2J6U70qIxGimj585UuTnVC8BmRCQ==">

  <script src="https://d1nyaccf3kuclt.cloudfront.net/dist/vendor-4eb2123be16be489230b.js"></script>
  <script src="https://d1nyaccf3kuclt.cloudfront.net/dist/utils-8c4d2ca6b2219526b4cb.js"></script>
  <link rel="stylesheet" media="all" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/bucket_ui-a53f11dae59f1a56427b9ee5a59c04bb677989a0874426d3825e3dd8e4b49ea0.css">
  <link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/bucket_ui/components-a439447dd98d21797a2df58fafd1bca533e8123633d1ecd4646573fef04b9e58.css">
  <link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/layout/application-b2f7fc26c0541a87c070f3bb52d25bfb70f53b00d5f5bbfa4e355ac0f1425a10.css">
  <script src="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/application-39811550b642649108f541912d1bbaf72f923785f5c3724d9ec7036ff0230906.js"></script>
  
    <script src="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/components/toast-1481f938659e8967f63be6f2858678c31350686fdae93df1b103570932e083de.js"></script>
  <link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v2/component/report-4b83915a1d78d78660a56fb0900726669b494f39b14b4716df40f0187734a3de.css">
  <link rel="stylesheet" media="all" href="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/components/modal/scrap-927e308b7dd5a35b735d0704c26f74747f2ba06c8655e599abc0ac723e86e9b1.css">
  <script src="https://d1nyaccf3kuclt.cloudfront.net/assets/v3/components/modal/scrap-3537e93b9f4d54dfd4603338fe1c29afa0bcab6d91cc746617e914e601e88208.js"></script>
  <link rel="stylesheet" media="screen" href="https://d1nyaccf3kuclt.cloudfront.net/dist/CardDetail-8d6fd40bcdcc86ef3402c94a87d852d6.css">


  <!--[if lte IE 9]>
  <script>
    alert("본 서비스는 Microsoft Explorer 11 이하는 지원하지 않습니다. 브라우저를 업그레이드하고 사용하시거나 앱을 다운받아 사용하실 수 있습니다. 확인을 누르면 앱 다운로드 링크로 연결됩니다.");
    window.location.href = "https://play.google.com/store/apps/details?id=net.bucketplace&hl=kor";
  </script>
  <![endif]-->

  <!-- Sentry Testing -->
  <script src="https://cdn.ravenjs.com/3.26.4/raven.min.js" crossorigin="anonymous"></script>
  <script>
    Raven.config('https://b8e5cc27b3eb44be8b976b0c81dd4115@sentry.io/271486').install();
    Raven.setUserContext({
      id: '764692',
      email: 'tkddk92@naver.com',
      nickname: 'ivory726'
    });
  </script>

  <script type="application/ld+json">
  {
   "@context": "http://schema.org",
   "@type": "Organization",
   "name": "오늘의집",
   "url": "https://ohou.se",
   "sameAs": [
     "https://www.instagram.com/todayhouse/?hl=ko",
     "https://www.facebook.com/interiortoday",
     "https://m.post.naver.com/my.nhn?memberNo=202156",
     "https://itunes.apple.com/kr/app/id1008236892",
     "https://play.google.com/store/apps/details?id=net.bucketplace&hl=ko",
     "https://www.youtube.com/channel/UCBKtitA1RwY7F32rCniV1dA/featured"
   ]
  }
  </script>
<script async="" src="https://static.hotjar.com/c/hotjar-877658.js?sv=6"></script><script async="" src="https://script.hotjar.com/modules-ab5ba0ccf53ded68dfc9bbcb1e84cd7b.js"></script><style type="text/css">iframe#_hjRemoteVarsFrame {display: none !important; width: 1px !important; height: 1px !important; opacity: 0 !important; pointer-events: none !important;}</style></head>
<body>
<!-- Google Tag Manager (noscript) -->
<noscript>
  <iframe src="https://www.googletagmanager.com/ns.html?id=GTM-MK8DN2Q" height="0" width="0" style="display:none;visibility:hidden" allowfullscreen></iframe>
</noscript>
<!-- End Google Tag Manager (noscript) -->
  <div id="mobile-top-banner" class="mobile-top-banner--hidden">
    <button class="mobile-top-banner__img" style="background-image: url('https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-banners-download-1545046493788_e8fWuDO.jpg/1501/none');"></button>
    <button class="mobile-top-banner__close">
      <span class="icon icon-pointer-x-light"></span>
    </button>
  </div>
<div id="navigation" class="navigation--top-banner-hidden">
  <nav class="navigation-primary-wrap sticky-top" style="height: 81px;">
    <div class="navigation-primary__container sticky-content float open" style="position: fixed; bottom: auto; top: 0px;">
      <div class="navigation-primary">
        <button class="navigation-primary__menu-btn" aria-label="메뉴 열기">
          <span class="icon icon-etc-button-hamburger"></span>
        </button>
        <a class="navigation-primary__logo" href="/">
          <span class="icon icon-etc-brand-bi-md logo-md" aria-label="오늘의집"></span>
          <span class="icon icon-etc-brand-bi-xs logo-sm" aria-hidden="true"></span>
</a>        <div class="navigation-primary__menu open">
          <ul class="navigation-menu">
  <li class="navigation-menu__primary current active">
    <div class="title">
      <a href="/">
        <span class="icon mobile-icon icon-shortcut-home"></span>
        커뮤니티
        <span class="open-btn">
          <span class="icon mobile-icon icon-pointer-angle-down-dark-md"></span>
        </span>
</a>    </div>
    <ul>
        <li class="navigation-menu__primary__secondary ">
    <a href="/">홈</a>
  </li>

        <li class="navigation-menu__primary__secondary  active">
    <a href="/contents/card_collections">사진</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/projects?writer=self">집들이</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=advice">노하우</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=project&amp;userable_type=expert">전문가집들이</a>
  </li>

<!--      가구랭킹-->
<!--      실시간인기-->
        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=advice&amp;featured=true">셀프가이드</a>
  </li>

  <li class="navigation-menu__primary__secondary ">
    <a href="/questions">        질문과답변<span class="icon beta-icon icon-etc-badge-beta"></span><span class="icon beta-mobile-icon icon-shortcut-beta"></span>
</a>
  </li>
        <li class="navigation-menu__primary__secondary desktop-only">
    <a href="/competitions/feed">이벤트</a>
  </li>

    </ul>
  </li>
  <li class="navigation-menu__primary">
    <div class="title">
      <a href="/store">
        <span class="icon mobile-icon icon-shortcut-store"></span>
        스토어
        <span class="open-btn">
          <span class="icon mobile-icon icon-pointer-angle-down-dark-md"></span>
        </span>
</a>    </div>
    <ul>
        <li class="navigation-menu__primary__secondary ">
    <a href="/store">스토어홈</a>
  </li>

      <li class="navigation-menu__primary__secondary navigation-menu__category desktop-only ">
        <a data-ajax="false" href="/store/category?category=0&amp;order=popular">카테고리</a>
      </li>
        <li class="navigation-menu__primary__secondary ">
    <a href="/commerces/ranks">랭킹</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/exhibitions?showroom=false">SALE</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/productions/feed?selling=true&amp;theme=wedding">신혼가구</a>
  </li>

  <li class="navigation-menu__primary__secondary ">
    <a href="/commerces/custom_feeds/feed?logic=0&amp;per=24&amp;selling=true">          매일꿀템
</a>
  </li>
    </ul>
  </li>
  <li class="navigation-menu__primary">
    <div class="title">
      <a href="/experts">
        <span class="icon mobile-icon icon-shortcut-expert"></span>
        전문가
        <span class="open-btn">
          <span class="icon mobile-icon icon-pointer-angle-down-dark-md"></span>
        </span>
</a>    </div>
    <ul>
        <li class="navigation-menu__primary__secondary ">
    <a href="/experts">전문가홈</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/experts/calculator">견적계산</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/expert_users">전문가검색</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/experts/bangsan">방산시장</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=project&amp;userable_type=expert">포트폴리오</a>
  </li>

    </ul>
  </li>
</ul>

        </div>
        <div class="navigation-primary__search">
          <form class="navigation-search" action="#" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="✓">
  <div class="navigation-search__box" data-type="">
    <input class="navigation-search__box__submit" type="submit">
    <button class="navigation-search__box__category-btn" type="button"></button>
    <button class="navigation-search__box__icon" type="button">
      <span class="icon icon-etc-find-md-gray-dark"></span>
      <span class="icon icon-pointer-triangle-down-gray-dark-xs caret"></span>
    </button>
    <span class="navigation-search__box__icon_blur">
      <span class="icon icon-etc-find-md-gray-dark"></span>
    </span>
    <input class="navigation-search__box__input" type="text" placeholder="검색" disabled="" size="1" name="query" autocomplete="off" value="">
    <span class="navigation-search__box__bg"></span>
    <button class="navigation-search__box__cancel" type="button">
      <span class="icon icon-pointer-x-solid-md"></span>
    </button>
  </div>
<div style="display: none;"></div></form>
        </div>
        <div class="navigation-primary__actions">
          <button class="navigation-primary__search-btn navigation-primary__button button-sm" title="검색">
            <span class="icon icon-etc-find-md-gray-dark"></span>
            <span class="icon active icon-etc-find-md-white"></span>
          </button>
          <a class="navigation-primary__write-btn navigation-primary__button button-md" href="/upload_select">글쓰기</a>
          <a class="navigation-primary__cart-btn navigation-primary__button button-md" title="장바구니" href="/shoppingCart/764692">
            <span class="icon icon-etc-cart-gray"></span>
            <span class="icon active icon-etc-cart-white"></span>
</a>          <a class="navigation-primary__cart-btn navigation-primary__button button-sm-only" title="장바구니" href="/shoppingMobileCart/764692">
            <span class="icon icon-etc-cart-gray"></span>
            <span class="icon active icon-etc-cart-white"></span>
</a>            <a class="navigation-primary__notification-btn navigation-primary__button button-md" title="알림" href="/notifications/feed">
              <span class="icon icon-etc-noti-gray"></span>
              <span class="icon active icon-etc-noti-white"></span>
</a>        </div>
          <div class="navigation-primary__user logged">
            <input type="checkbox" id="navigation-primary__user__open" class="navigation-primary__user__open" data-role="none">
            <label for="navigation-primary__user__open" class="navigation-primary__user__header">
              <img src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png" onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'" aria-label="ivory726">
              <span class="icon icon-etc-inv-triangle-gray"></span>
              <span class="icon active icon-etc-inv-triangle-blue"></span>
            </label>
            <div class="navigation-primary__user__list ">
              <ul class="navigation-user-menu">
    <li><a href="/users/764692">마이홈</a></li>
  <li><a href="/user_shopping_pages/order_list">나의 쇼핑</a></li>
  <li>
    <a class="mobile-only" href="/notifications/feed">
      알림
</a>  </li>
  <li><a href="/competitions/feed">이벤트</a></li>
  <li><a class="mobile-only" href="/snapshots/upload_card">사진 올리기</a></li>
  <li><a class="mobile-only navigation-user-menu__question-new" href="/questions/new">질문하기</a></li>
  <div class="navigation-user-menu__bottom">
      <li><a href="https://pro.ohou.se/?utm_source=ohouse&amp;utm_medium=web&amp;utm_campaign=prosignup&amp;utm_content=myhome">전문가 신청</a></li>
      <li><a href="/partner/applications/new">판매자 신청</a></li>
      <li><a rel="nofollow" data-method="delete" href="/users/sign_out">로그아웃</a></li>
  </div>
</ul>

            </div>
          </div>
      </div>
    </div>
  </nav>
  <nav class="navigation-secondary-wrap sticky-top" style="height: auto;">
    <div class="navigation-secondary__container sticky-content open" style="position: relative;">
      <div class="navigation-secondary">
        <div class="navigation-secondary__menu"><ul>
        <li class="navigation-menu__primary__secondary ">
    <a href="/">홈</a>
  </li>

        <li class="navigation-menu__primary__secondary  active">
    <a href="/contents/card_collections">사진</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/projects?writer=self">집들이</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=advice">노하우</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=project&amp;userable_type=expert">전문가집들이</a>
  </li>

<!--      가구랭킹-->
<!--      실시간인기-->
        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=advice&amp;featured=true">셀프가이드</a>
  </li>

  <li class="navigation-menu__primary__secondary ">
    <a href="/questions">        질문과답변<span class="icon beta-icon icon-etc-badge-beta"></span><span class="icon beta-mobile-icon icon-shortcut-beta"></span>
</a>
  </li>
        <li class="navigation-menu__primary__secondary desktop-only">
    <a href="/competitions/feed">이벤트</a>
  </li>

    </ul></div>
        <div class="navigation-secondary__download">
          <a class="navigation-secondary__download__link" href="/app">
            <span class="icon icon-etc-brand-app-icon-sm"></span>앱다운로드
</a>        </div>
      </div>
    </div>
  </nav>
  <nav class="navigation-category-wrap">
    <div class="navigation-category__container">
      <div class="navigation-category">
        <ul class="navigation-category__list">
            <a class="navigation-category__list__item" href="/store/category?category=0&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-0.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">가구</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=1&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-1.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">패브릭</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=2&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-2.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">홈데코/조명</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=3&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-3.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">가전</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=4&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-4_0.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">수납/생활</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=5&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-5.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">주방</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=6&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-6.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">DIY자재</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=7&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-7.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">시공/주문제작</p>
              </span>
</a>            <a class="navigation-category__list__item" href="/store/category?category=8&amp;order=popular">
              <div class="image-wrap">
                <img data-src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-product_category-8.png/320/320">
              </div>
              <span class="title">
                <p style="margin: 0 -10px;">반려동물</p>
              </span>
</a>        </ul>
      </div>
    </div>
  </nav>
  <nav class="navigation-drawer-wrap">
    <button class="navigation-drawer__close" aria-label="패널 닫기"></button>
    <div class="navigation-drawer">
      <div class="navigation-drawer__header">
        <a class="navigation-drawer__header__logo" href="/">
          <span class="icon icon-etc-brand-bi-sm" aria-label="오늘의집"></span>
</a>        <div class="navigation-drawer__header__download">
          <a class="navigation-drawer__header__download__link" href="/app">
            <span class="icon icon-etc-brand-app-icon-sm"></span>앱다운로드
</a>        </div>
      </div>
        <div class="navigation-drawer__user logged">
          <a class="navigation-drawer__user__header" href="/users/764692">
            <img src="https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png" onerror="this.src='https://bucketplace-v2-development.s3.amazonaws.com/uploads/default_images/avatar.png'">
            <span class="navigation-drawer__user__header__text">
              ivory726
            </span>
</a>        </div>
      <div class="navigation-drawer__menu">
        <ul class="navigation-menu">
  <li class="navigation-menu__primary current">
    <div class="title">
      <a href="/">
        <span class="icon mobile-icon icon-shortcut-home"></span>
        커뮤니티
        <span class="open-btn">
          <span class="icon mobile-icon icon-pointer-angle-down-dark-md"></span>
        </span>
</a>    </div>
    <ul>
        <li class="navigation-menu__primary__secondary ">
    <a href="/">홈</a>
  </li>

        <li class="navigation-menu__primary__secondary  active">
    <a href="/contents/card_collections">사진</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/projects?writer=self">집들이</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=advice">노하우</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=project&amp;userable_type=expert">전문가집들이</a>
  </li>

<!--      가구랭킹-->
<!--      실시간인기-->
        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=advice&amp;featured=true">셀프가이드</a>
  </li>

  <li class="navigation-menu__primary__secondary ">
    <a href="/questions">        질문과답변<span class="icon beta-icon icon-etc-badge-beta"></span><span class="icon beta-mobile-icon icon-shortcut-beta"></span>
</a>
  </li>
        <li class="navigation-menu__primary__secondary desktop-only">
    <a href="/competitions/feed">이벤트</a>
  </li>

    </ul>
  </li>
  <li class="navigation-menu__primary">
    <div class="title">
      <a href="/store">
        <span class="icon mobile-icon icon-shortcut-store"></span>
        스토어
        <span class="open-btn">
          <span class="icon mobile-icon icon-pointer-angle-down-dark-md"></span>
        </span>
</a>    </div>
    <ul>
        <li class="navigation-menu__primary__secondary ">
    <a href="/store">스토어홈</a>
  </li>

      <li class="navigation-menu__primary__secondary navigation-menu__category desktop-only ">
        <a data-ajax="false" href="/store/category?category=0&amp;order=popular">카테고리</a>
      </li>
        <li class="navigation-menu__primary__secondary ">
    <a href="/commerces/ranks">랭킹</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/exhibitions?showroom=false">SALE</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/productions/feed?selling=true&amp;theme=wedding">신혼가구</a>
  </li>

  <li class="navigation-menu__primary__secondary ">
    <a href="/commerces/custom_feeds/feed?logic=0&amp;per=24&amp;selling=true">          매일꿀템
</a>
  </li>
    </ul>
  </li>
  <li class="navigation-menu__primary">
    <div class="title">
      <a href="/experts">
        <span class="icon mobile-icon icon-shortcut-expert"></span>
        전문가
        <span class="open-btn">
          <span class="icon mobile-icon icon-pointer-angle-down-dark-md"></span>
        </span>
</a>    </div>
    <ul>
        <li class="navigation-menu__primary__secondary ">
    <a href="/experts">전문가홈</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/experts/calculator">견적계산</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/expert_users">전문가검색</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/experts/bangsan">방산시장</a>
  </li>

        <li class="navigation-menu__primary__secondary ">
    <a href="/magazines?content_type=project&amp;userable_type=expert">포트폴리오</a>
  </li>

    </ul>
  </li>
</ul>

      </div>
      <div class="navigation-drawer__user_menu">
        <ul class="navigation-user-menu">
    <li><a href="/users/764692">마이홈</a></li>
  <li><a href="/user_shopping_pages/order_list">나의 쇼핑</a></li>
  <li>
    <a class="mobile-only" href="/notifications/feed">
      알림
</a>  </li>
  <li><a href="/competitions/feed">이벤트</a></li>
  <li><a class="mobile-only" href="/snapshots/upload_card">사진 올리기</a></li>
  <li><a class="mobile-only navigation-user-menu__question-new" href="/questions/new">질문하기</a></li>
  <div class="navigation-user-menu__bottom">
      <li><a href="https://pro.ohou.se/?utm_source=ohouse&amp;utm_medium=web&amp;utm_campaign=prosignup&amp;utm_content=myhome">전문가 신청</a></li>
      <li><a href="/partner/applications/new">판매자 신청</a></li>
      <li><a rel="nofollow" data-method="delete" href="/users/sign_out">로그아웃</a></li>
  </div>
</ul>

      </div>
    </div>
  </nav>
  <nav class="navigation-search-drawer-wrap">
    <button class="navigation-search-drawer__close" aria-label="패널 닫기"></button>
    <div class="navigation-search-drawer">
      <form class="navigation-search" action="#" accept-charset="UTF-8" method="get"><input name="utf8" type="hidden" value="✓">
  <div class="navigation-search__box" data-type="">
    <input class="navigation-search__box__submit" type="submit">
    <button class="navigation-search__box__category-btn" type="button"></button>
    <button class="navigation-search__box__icon" type="button">
      <span class="icon icon-etc-find-md-gray-dark"></span>
      <span class="icon icon-pointer-triangle-down-gray-dark-xs caret"></span>
    </button>
    <span class="navigation-search__box__icon_blur">
      <span class="icon icon-etc-find-md-gray-dark"></span>
    </span>
    <input class="navigation-search__box__input" type="text" placeholder="검색" disabled="" size="1" name="query" autocomplete="off" value="">
    <span class="navigation-search__box__bg"></span>
    <button class="navigation-search__box__cancel" type="button">
      <span class="icon icon-pointer-x-solid-md"></span>
    </button>
  </div>
<div style="display: none;"></div></form>
    </div>
  </nav>
</div>

<div id="modal-question-write" class="modal fade fade-done">
    <div class="modal-dialog" role="document" style="
            
            
         ">
        
  <div class="modal-question-write__content">
    <a class="btn btn-lg btn-priority modal-question-write__content__button" href="/questions/new">인테리어 질문하기</a>
    <a class="btn btn-lg btn-priority modal-question-write__content__button" href="/contact_us">구매 및 배송 문의</a>
  </div>

    </div>
</div>


<main role="main" id="root">
  


<div id="ios_deep_link" style="display: none!important">ohouseApp://CardCollectionDetail/439435</div><div id="android_deep_link" style="display: none!important">intent://ohou.se/deep?type=CardCollectionDetail&amp;id=439435#Intent;scheme=http;package=net.bucketplace;end</div>









<div data-react-class="CardDetail" data-react-props="{&quot;location&quot;:&quot;/contents/card_collections/439435&quot;,&quot;user&quot;:{&quot;id&quot;:764692,&quot;nickname&quot;:&quot;ivory726&quot;,&quot;profileImageUrl&quot;:&quot;https://bucketplace-v2-development.s3.amazonaws.com/uploads/users/profile_images/1487932965_facebook_1366894266705280.jpg&quot;,&quot;userableType&quot;:&quot;NormalUser&quot;,&quot;userableId&quot;:810551,&quot;isAdmin&quot;:false}}" data-hydrate="t"><div data-reactroot=""><div class="card-detail container"><article class="row"><section class="col-12 col-lg-8"><header><p class="category"></p><time>1분 미만 전</time></header><section class="card-section"><figure><div class="card-img card-img--pc"><div class="card-img__bg" style="padding-top: 100%;"></div><img src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-1549872034643_kyINb.jpg/850/none" srcset="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-1549872034643_kyINb.jpg/1280/none 1.5x,https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-1549872034643_kyINb.jpg/1536/none 2x,https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-cards-snapshots-1549872034643_kyINb.jpg/2560/none 3x"><div class="card-img__tags"><span class="product-tag" style="left: 27.1%; top: 23.2%;"><svg class="product-tag__icon" xmlns="http://www.w3.org/2000/svg" width="24px" height="24px"><g><circle class="product-tag__icon__bg" cx="12px" cy="12px" r="12px" fill="#757575" fill-opacity=".7"></circle><path d="M11 11 V7 H13 V11 H17 V13 H13 V17 H11 V13 H7 V11 Z" fill="#fff"></path></g></svg></span></div><div class="card-img__btn-manage"><a href="/cards/648168/add_tags">태그관리</a><a href="/cards/648168/edit">수정하기</a></div></div></figure></section><section class="footer"><hr class="section-divider"><div class="footer__stats"><div class="footer__stats__item"><span>조회 3</span></div><div class="footer__stats__item"><span>댓글 0</span></div><div class="footer__stats__item"><span>공유 0</span></div></div><div class="footer__share"><div class="share-card"><div><a class="share-card__btn" target="_blank" rel="noopener noreferrer" href="https://www.facebook.com/sharer.php?u=https://ohou.se/contents/card_collections/439435"><span class="icon--page-card" style="background-position: -80px -40px; width: 48px; height: 48px;"></span></a></div><div><a class="share-card__btn" target="_blank" rel="noopener noreferrer" href="http://share.naver.com/web/shareView.nhn?url=https://ohou.se/contents/card_collections/439435&amp;title=ivory726님의 사진"><span class="icon--page-card" style="background-position: -160px -40px; width: 48px; height: 48px;"></span></a></div><div><button class="share-card__btn"><span class="icon--page-card" style="background-position: -240px -40px; width: 48px; height: 48px;"></span></button></div><div><button class="share-card__btn"><span class="icon--page-card" style="background-position: -320px -40px; width: 48px; height: 48px;"></span></button></div><div class="share-card__url tooltip invisible"><p>https://ohou.se/contents/card_collections/439435</p><button>복사</button></div></div></div><hr class="section-divider"><section class="footer__writer"><div class="writer-profile"><div class="writer-profile__img"><a href="/users/764692"><img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/72/72" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/80/80 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/144/144 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/160/160 3x"></a></div><div><a href="/users/764692"><strong class="writer-profile__name">ivory726</strong></a><a href="/users/764692"><p class="writer-profile__about"></p></a></div></div><p class="footer__parent"><a href="/users/764692/cards"></a></p><section class="footer__other row"></section></section><hr class="section-divider"></section><section class="comment-feed"><h1 class="comment-feed__header">댓글&nbsp;<span class="comment-feed__header__count zero">0</span></h1><form class="comment-feed__form"><div class="comment-feed__form__user"><img src="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/36/none" srcset="https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/72/none 1.5x,https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/72/none 2x,https://image.ohou.se/image/resize/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/144/none 3x"></div><div class="comment-feed__form__input"><div class="comment-feed__form__content"><div class="comment-content-input"><div class="comment-content-input__text comment-feed__form__content__text" data-ph="칭찬과 격려의 댓글은 작성자에게 큰 힘이 됩니다 :)" contenteditable="true"></div></div></div><div class="comment-feed__form__actions"><button class="comment-feed__form__submit" aria-label="작성" disabled=""><svg width="24" height="24" preserveAspectRatio="xMidYMid meet"><g fill="none" fill-rule="evenodd" stroke="#757575" stroke-width="1.5"><path d="M6 12h10M13 16.2l4.2-4.2L13 7.8"></path><circle cx="12" cy="12" r="11.3"></circle></g></svg></button></div></div></form><ul class="comment-feed__list"></ul></section></section><aside class="col-4 sidebar"><div data-enabled="false" data-direction="top" data-offset="0" class="sticky-container sidebar__sticky" style="position: sticky; top: 131px;"><div class="sticky-child" style="position: relative;"><div class="sidebar__container" style="height: 807px;"><div style="padding-top: 40px;"><section class="sidebar__action"><div><button class="sidebar__action__btn"><span class="icon--common-action" style="vertical-align: middle; margin-right: 8px; background-position: -240px -280px; width: 24px; height: 24px;"></span></button></div><div><button class="sidebar__action__btn"><span class="icon--common-action" style="vertical-align: middle; margin-right: 8px; background-position: -280px -280px; width: 24px; height: 24px;"></span></button></div><div class="mine"><button class="sidebar__action__btn--mine"><span class="icon--page-card" style="vertical-align: middle; background-position: -120px 0px; width: 24px; height: 24px;"></span></button><div class="sidebar__action__menu dismiss"><button>삭제</button></div></div></section><section class="sidebar__writer writer-info"><div class="writer-profile"><div class="writer-profile__img"><a href="/users/764692"><img src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/72/72" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/80/80 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/144/144 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-users-profile_images-1487932965_facebook_1366894266705280.jpg/160/160 3x"></a></div><div><a href="/users/764692"><strong class="writer-profile__name">ivory726</strong></a><a href="/users/764692"><p class="writer-profile__about"></p></a></div></div></section><section class="sidebar__others"></section></div><section class="sidebar__share"><div class="share-card"><div><a class="share-card__btn" target="_blank" rel="noopener noreferrer" href="https://www.facebook.com/sharer.php?u=https://ohou.se/contents/card_collections/439435"><span class="icon--page-card" style="background-position: -80px -40px; width: 48px; height: 48px;"></span></a></div><div><a class="share-card__btn" target="_blank" rel="noopener noreferrer" href="http://share.naver.com/web/shareView.nhn?url=https://ohou.se/contents/card_collections/439435&amp;title=ivory726님의 사진"><span class="icon--page-card" style="background-position: -160px -40px; width: 48px; height: 48px;"></span></a></div><div><button class="share-card__btn"><span class="icon--page-card" style="background-position: -240px -40px; width: 48px; height: 48px;"></span></button></div><div><button class="share-card__btn"><span class="icon--page-card" style="background-position: -320px -40px; width: 48px; height: 48px;"></span></button></div><div class="share-card__url tooltip invisible"><p>https://ohou.se/contents/card_collections/439435</p><button>복사</button></div></div></section></div></div></div></aside><div class="floating-bar"><div class="container" style="position: relative; height: 100%;"><button class="floating-bar__btn-menu"><span class="icon--common-action" style="vertical-align: middle; margin-right: 6px; background-position: 0px -280px; width: 24px; height: 24px;"></span></button><button class="floating-bar__btn-menu"><span class="icon--common-action" style="vertical-align: middle; margin-right: 6px; background-position: -80px -280px; width: 24px; height: 24px;"></span></button><button class="floating-bar__btn-menu"><span class="icon--common-action" style="vertical-align: middle; margin-right: 6px; background-position: -160px -280px; width: 24px; height: 24px;"></span></button><button class="floating-bar__btn-menu"><span class="icon--common-action" style="vertical-align: middle; margin-right: 6px; background-position: -200px -280px; width: 24px; height: 24px;"></span></button><div class="share-tooltip--my-home"><button class="share-tooltip__btn-toggle"><span class="icon--common-action" style="background-position: -200px 0px; width: 28px; height: 28px;"></span></button><div class="share-tooltip__tooltip" style="right: 0px; bottom: 100%; transition: opacity 0.3s ease 0s, transform 0.3s ease 0s, visibility 0s ease 0.3s; opacity: 0; transform: translateY(-16px); visibility: hidden;"><a class="share-tooltip__btn-share" href="https://www.facebook.com/sharer.php?u=ohou.se/contents/card_collections/439435" target="_blank" rel="noopener noreferrer"><span class="icon icon-sns-square-facebook"></span></a><button class="share-tooltip__btn-share"><span class="icon icon-sns-square-kakao-story"></span></button><a class="share-tooltip__btn-share" href="http://share.naver.com/web/shareView.nhn?url=ohou.se/contents/card_collections/439435&amp;title=ivory726님의 사진" target="_blank" rel="noopener noreferrer"><span class="icon icon-sns-square-naver"></span></a></div></div></div></div></article><section class="col-12"><hr class="section-divider"><div class="recommend"><p class="recommend__title">유저들의 비슷한 공간 베스트</p><div class="row recommend__list"><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/104529/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066964800_OnWcmlplg.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066964800_OnWcmlplg.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066964800_OnWcmlplg.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066964800_OnWcmlplg.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/96369/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1491980609167_Y14P.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1491980609167_Y14P.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1491980609167_Y14P.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1491980609167_Y14P.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/104528/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066875963_fhSQzt.JPG/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066875963_fhSQzt.JPG/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066875963_fhSQzt.JPG/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496066875963_fhSQzt.JPG/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/94392/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1490854819749_MonJRaAns.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1490854819749_MonJRaAns.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1490854819749_MonJRaAns.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1490854819749_MonJRaAns.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/85031/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485339641050_ZaHM.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485339641050_ZaHM.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485339641050_ZaHM.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485339641050_ZaHM.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/122004/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503897975547_nBRX.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503897975547_nBRX.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503897975547_nBRX.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503897975547_nBRX.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/463331/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1542619419258_8WE.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1542619419258_8WE.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1542619419258_8WE.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1542619419258_8WE.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/121936/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503884899847_2vzK6T.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503884899847_2vzK6T.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503884899847_2vzK6T.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503884899847_2vzK6T.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/122015/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903822164_I9q.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903822164_I9q.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903822164_I9q.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903822164_I9q.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/107013/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1497347176317_pB.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1497347176317_pB.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1497347176317_pB.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1497347176317_pB.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/105845/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496798310630_tECM4o.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496798310630_tECM4o.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496798310630_tECM4o.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496798310630_tECM4o.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/121995/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503895985355_UVjw.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503895985355_UVjw.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503895985355_UVjw.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503895985355_UVjw.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/105731/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770652_5.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770652_5.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770652_5.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770652_5.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/108696/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498199428235_Z0.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498199428235_Z0.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498199428235_Z0.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498199428235_Z0.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/113145/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363462371_wdyWu0OA.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363462371_wdyWu0OA.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363462371_wdyWu0OA.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363462371_wdyWu0OA.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/109080/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498466837246_opwejCCpgL.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498466837246_opwejCCpgL.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498466837246_opwejCCpgL.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1498466837246_opwejCCpgL.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/116328/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1501655063065_v0a.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1501655063065_v0a.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1501655063065_v0a.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1501655063065_v0a.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/113134/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363236141_ur.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363236141_ur.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363236141_ur.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1500363236141_ur.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/85409/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485779533244_dvcWD4AI.JPG/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485779533244_dvcWD4AI.JPG/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485779533244_dvcWD4AI.JPG/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1485779533244_dvcWD4AI.JPG/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/125396/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1505115981079_VZ.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1505115981079_VZ.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1505115981079_VZ.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1505115981079_VZ.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/131657/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1507726423666_GwZ.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1507726423666_GwZ.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1507726423666_GwZ.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1507726423666_GwZ.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/122016/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903923417_geL44Pknv.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903923417_geL44Pknv.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903923417_geL44Pknv.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1503903923417_geL44Pknv.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/135229/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1508820641031_u7Yrvr.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1508820641031_u7Yrvr.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1508820641031_u7Yrvr.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1508820641031_u7Yrvr.jpg/960/960 3x"></a></div><div class="recommend__list__col col-md-4 col-lg-3"><a href="/cards/105732/detail?affect_type=CardDetailInfinite&amp;affect_id=439435"><img class="recommend__item" src="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770613_oO1c.jpg/320/320" srcset="https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770613_oO1c.jpg/480/480 1.5x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770613_oO1c.jpg/640/640 2x,https://image.ohou.se/image/central_crop/bucketplace-v2-development/uploads-cards-projects-1496677770613_oO1c.jpg/960/960 3x"></a></div></div></div></section></div></div></div>
  <div id="modal--scrap" class="modal fade fade-done prevent-dim">
    <div class="modal-dialog" role="document" style="
            
            
         ">
        
    <!--data: local_assigns[:data].blank? ? {} : local_assigns[:data]-->
    <div class="modal--scrap__item-image">
      <div class="modal--scrap__item-image__wrap">
        <img src="">
      </div>
    </div>
    <div class="modal--scrap__books">
      <div class="modal--scrap__books__header">
        <p class="modal--scrap__books__title">스크랩북을 선택하세요</p>
        <img class="modal--scrap__books__btn-close" data-dismiss="modal" src="/assets/icon_map/v4/x-6-black-bold.png" srcset="/assets/icon_map/v4/x-6-black-bold@2x.png 2x, /assets/icon_map/v4/x-6-black-bold@3x.png 3x">
      </div>
      <ul class="modal--scrap__books__list" role="button">
        <li class="modal--scrap__books__item modal--scrap__books__item--new">
          <div class="modal--scrap__books__item__image">
            <img src="/assets/icon_map/v4/etc-plus-14-w.png" srcset="/assets/icon_map/v4/etc-plus-14-w@2x.png 2x, /assets/icon_map/v4/etc-plus-14-wb@3x.png 3x">
          </div>
          <div class="modal--scrap__books__item__name">새로운 스크랩북 만들기</div>
          <img class="modal--scrap__books__item__icon" src="/assets/icon_map/v4/action-scrap-circle-b.png" srcset="/assets/icon_map/v4/action-scrap-circle-b@2x.png 2x, /assets/icon_map/v4/action-scrap-circle-b@3x.png 3x">
        </li>
        <div class="modal--scrap__books__form dismiss">
          <input type="text" name="book-name" class="modal--scrap__books__form__input" placeholder="스크랩북 이름을 입력하세요">
          <p class="modal--scrap__books__form__error"></p>
          <div class="modal--scrap__books__form__buttons">
            <button class="btn btn-sm btn-priority modal--scrap__books__form__btn modal--scrap__books__form__btn--confirm" disabled="">완료</button>
            <button class="btn btn-sm btn-simple modal--scrap__books__form__btn modal--scrap__books__form__btn--cancel">취소</button>
          </div>
        </div>
        <li class="modal--scrap__books__item modal--scrap__books__item--empty" role="button">
          <div class="modal--scrap__books__item__image">
            <img src="">
          </div>
          <div class="modal--scrap__books__item__name"></div>
          <img class="modal--scrap__books__item__icon" src="/assets/icon_map/v4/action-scrap-circle-b.png" srcset="/assets/icon_map/v4/action-scrap-circle-b@2x.png 2x, /assets/icon_map/v4/action-scrap-circle-b@3x.png 3x">
        </li>
      </ul>
    </div>

    </div>
</div>

<script src="https://d1nyaccf3kuclt.cloudfront.net/dist/CardDetail-9806ff6c9960d961660c.js"></script>

</main>
<div id="modal-root"></div>
<div id="toast-message-root"></div>

<div id="flash_messages"></div>


  

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

  

  <script type="text/javascript" src="https://wcs.naver.net/wcslog.js"></script>
  
  <script>
    if (!wcs_add) var wcs_add = {};
    wcs_add['wa'] = 's_2e85116be219';
    if (!_nasa) var _nasa = {};
    wcs.inflow();
    wcs_do(_nasa);
  </script>

  <script type="text/javascript" charset="UTF-8" src="//t1.daumcdn.net/adfit/static/kp.js"></script>
    <script>
      kakaoPixel('7919701595446099671').pageView();
    </script>




  <script>
    if (BucketUtils.easter !== undefined) {
      BucketUtils.easter();
    }
  </script>



<script type="text/javascript" id="">(function(){var b="change",c=function(a){window.dataLayer.push({event:"gtm."+a.type,"gtm.element":a.target,"gtm.elementClasses":a.target.className||"","gtm.elementId":a.target.id||"","gtm.elementTarget":a.target.target||"","gtm.elementUrl":a.target.href||a.target.action||"","gtm.originalEvent":a})};document.addEventListener?document.addEventListener(b,c,!1):document.attachEvent&&document.attachEvent("on"+b,c)})();</script><script type="text/javascript" id="">var gtm=google_tag_manager[google_tag_manager["GTM-MK8DN2Q"].macro(10)];
(function(e,t){var n=e.amplitude||{_q:[],_iq:{}};var r=t.createElement("script");r.type="text/javascript";r.async=true;r.src="https://cdn.amplitude.com/libs/amplitude-4.2.1-min.gz.js";r.onload=function(){if(e.amplitude.runQueuedFunctions)e.amplitude.runQueuedFunctions();else console.log("[Amplitude] Error: could not load SDK")};var i=t.getElementsByTagName("script")[0];i.parentNode.insertBefore(r,i);function s(e,t){e.prototype[t]=function(){this._q.push([t].concat(Array.prototype.slice.call(arguments,0)));
return this}}var o=function(){this._q=[];return this};var a=["add","append","clearAll","prepend","set","setOnce","unset"];for(var u=0;u<a.length;u++)s(o,a[u]);n.Identify=o;var c=function(){this._q=[];return this};var l=["setProductId","setQuantity","setPrice","setRevenueType","setEventProperties"];for(var p=0;p<l.length;p++)s(c,l[p]);n.Revenue=c;var d=["init","logEvent","logRevenue","setUserId","setUserProperties","setOptOut","setVersionName","setDomain","setDeviceId","setGlobalUserProperties","identify",
"clearUserProperties","setGroup","logRevenueV2","regenerateDeviceId","logEventWithTimestamp","logEventWithGroups","setSessionId","resetSessionId"];function v(e){function t(t){e[t]=function(){e._q.push([t].concat(Array.prototype.slice.call(arguments,0)))}}for(var n=0;n<d.length;n++)t(d[n])}v(n);n.getInstance=function(e){e=(!e||e.length===0?"$default_instance":e).toLowerCase();if(!n._iq.hasOwnProperty(e)){n._iq[e]={_q:[]};v(n._iq[e])}return n._iq[e]};e.amplitude=n})(window,document);
amplitude.getInstance().init("232d5a99fff3fb0c75a4950d450cbbb1",null,{includeGclid:true,includeUtm:true,includeReferrer:true});if("764692"!=="\ube44\ud68c\uc6d0")amplitude.getInstance().setUserId("764692");function cont(){if(typeof gaData!=="undefined"){amplitude.getInstance().setUserProperties(gaData["UA-46752799-1"]&&gaData["UA-46752799-1"].experiments||{});gtm.onHtmlSuccess(11)}else setTimeout(cont,10)}cont();</script>
<script type="text/javascript" id="">(function(a,c,e,f,d,b){a.hj=a.hj||function(){(a.hj.q=a.hj.q||[]).push(arguments)};a._hjSettings={hjid:877658,hjsv:6};d=c.getElementsByTagName("head")[0];b=c.createElement("script");b.async=1;b.src=e+a._hjSettings.hjid+f+a._hjSettings.hjsv;d.appendChild(b)})(window,document,"https://static.hotjar.com/c/hotjar-",".js?sv\x3d");</script>
<div id="ads"></div><iframe name="_hjRemoteVarsFrame" title="_hjRemoteVarsFrame" id="_hjRemoteVarsFrame" src="https://vars.hotjar.com/box-de263bbc9261861ab6eefe1285fa249b.html" style="display: none !important; width: 1px !important; height: 1px !important; opacity: 0 !important; pointer-events: none !important;"></iframe></body></html>