[![Build Status](https://github.com/Suban05/rails-project-63/workflows/CI/badge.svg)](https://github.com/Suban05/rails-project-63/actions)
[![Build Status](https://github.com/Suban05/rails-project-63/workflows/hexlet-check/badge.svg)](https://github.com/Suban05/rails-project-63/actions)

# Form generator

## Usage

```rb
User = Struct.new(:name, :job, :gender, keyword_init: true)
user = User.new name: 'rob', job: 'hexlet', gender: 'm'
HexletCode.form_for user do |f|
  f.input :name
  f.input :job, as: :text
end

# <form action="#" method="post">
#   <input name="name" type="text" value="rob">
#   <textarea name="job" cols="20" rows="40">hexlet</textarea>
# </form>
```

## Running Tests

To run the test suite, first install the necessary dependencies:

```bash
make install
```

Then, you can run the tests with:

```bash
rake test
```
