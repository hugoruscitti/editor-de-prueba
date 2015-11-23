import Ember from 'ember';

export default Ember.Service.extend({

  run(sourceCode) {
    alert(sourceCode);

    /*

    var runButton = document.getElementById("runButton");
    var codeElement = document.getElementById("code");


    function evaluate(code) {
      alert(code);
    };

    var reevaluate = function(code) {
        capturingConsole = Object.create(console);
        var $consoleReporter = this.$consoleReporter;
        var buffer = [];
        var error;
        var done = false;

        function flush() {
          $consoleReporter.text(buffer.join('\n'));
        }

        function write(data) {
          buffer.push(data);
          if (done) flush();
        }

        capturingConsole.clear = function() {
          buffer = [];
          flush();
        };

        capturingConsole.error = function () {
          error = true;
          capturingConsole.log.apply(capturingConsole, arguments);
        };

        capturingConsole.log =
        capturingConsole.info =
        capturingConsole.debug = function() {
          if (this !== capturingConsole) { return; }

          var args = Array.prototype.slice.call(arguments);
          Function.prototype.apply.call(console.log, console, args);

          var logs = args.reduce(function (logs, log) {
            if (typeof log === 'string') {
              logs.push(log);
            } else if (log instanceof Function) {
              logs.push(log.toString());
            } else {
              logs.push(JSON.stringify(log));
            }
            return logs;
          }, []);

          write(logs.join(' '));
        };

        try {
          new Function('console', code)(capturingConsole);
        } catch (err) {
          error = err;
          buffer.push(err.message);
        }

        done = true;
        flush();

        if (error) throw error;
      };




    runButton.onclick = function() {
        var transformed;
        var code = codeElement.value;
        //this.clearOutput();

        try {
          transformed = babel.transform(code, {
            stage: 2,
            loose: true,
            filename: 'repl'
          });
        } catch (err) {
          alert(err);
          //this.printError(err.message);
          throw err;
        }

        //this.setOutput(transformed.code);

        evaluate(transformed.code);
    };
    */
  }
  
});
