package HTML::FormFu::Preload;

use strict;
use warnings;

use Module::Pluggable::Fast (
    search => [
        qw/
            HTML::FormFu::Element
            HTML::FormFu::Constraint
            HTML::FormFu::Deflator
            HTML::FormFu::Filter
            HTML::FormFu::Inflator
            HTML::FormFu::Result
            HTML::FormFu::Render
            /
    ],
    require => 1
);

__PACKAGE__->plugins;

1;
