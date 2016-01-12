(function() {
  CKEDITOR.editorConfig = function(config) {
    config.scayt_autoStartup = true;
    config.extraPlugins = 'dialog';
    config.toolbar = config.toolbar_basic;
    config.toolbar_basic = [['Save', '-', 'Cut', 'Copy', 'Paste', 'PasteText', 'PasteFromWord', '-', 'Undo', 'Redo'], ['Bold', 'Italic', 'Underline', '-', 'JustifyLeft', 'JustifyCenter', 'JustifyRight', 'JustifyBlock'], ['Smiley', 'Preview', 'Find', 'Replace', 'Link', 'Unlink', '-', 'Image'], ['Table', 'Font', 'FontSize', '-', 'TextColor', 'BGColor', '-', 'Maximize']];
    return true;
  };

}).call(this);
