HTMLWidgets.widget({

  name: 'diffRgit',

  type: 'output',

  factory: function(el, width, height) {

    return {

      renderValue: function(x) {

        el.innerHTML = Diff2Html.getPrettyHtml(x.diff,{
          inputFormat : x.settings.inputFormat,
          outputFormat : x.settings.outputFormat,
          showFiles : x.settings.showFiles,
          matching : x.settings.matching,
          synchronisedScroll : x.settings.synchronisedScroll,
          matchWordsThreshold : x.settings.matchWordsThreshold,
          matchingMaxComparisons : x.settings.matchingMaxComparisons
        });

      },

      resize: function(width, height) {

      }

    };
  }
});
