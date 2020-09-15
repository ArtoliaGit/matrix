module.exports = {
  root: true,

  env: {
    node: true,
  },

  extends: [
    'plugin:vue/strongly-recommended',
    '@vue/airbnb',
  ],

  parserOptions: {
    parser: 'babel-eslint',
  },

  rules: {
    'no-console': 'off',
    'no-debugger': process.env.NODE_ENV === 'production' ? 'warn' : 'off',
    'no-param-reassign': 'off',
    'class-methods-use-this': 'off',
    'no-unused-vars': 'off',
    'import/prefer-default-export': 'off',
    'arrow-parens': 'off',
    'import/no-extraneous-dependencies': 'off',
    'prefer-destructuring': 'off',
    'vue/singleline-html-element-content-newline': 'off',
    'import/extensions': 'off',
    'vue/max-attributes-per-line': 'off',
    'import/no-cycle': 'off',
    'no-return-assign': 'off',
  },

};
