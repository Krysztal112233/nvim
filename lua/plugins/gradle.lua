return {
  'oclay1st/gradle.nvim',
  cmd = { 'Gradle', 'GradleExec', 'GradleInit', 'GradleFavorites' },
  dependencies = {
    'MunifTanjim/nui.nvim',
  },
  opts = {
    gradle_executable = './gradlew',
  }, -- options, see default configuration
}
