use strict;
use warnings;

use Test::More tests => 12;

use HTML::FormFu;

my $form = HTML::FormFu->new;

$form->element('text')->name('foo');
$form->element('text')->name('bar');
$form->element('text')->name('string');

$form->constraint( 'Number', 'foo', 'bar', 'string' );

$form->process( {
        foo    => 1,
        bar    => [ 2, 'c' ],
        string => 'yada',
    } );

{
    my $errors = $form->errors;

    is( @$errors, 2 );
}

{
    my $errors = $form->errors('bar');

    is( @$errors, 1 );

    is( $errors->[0]->name, 'bar' );
    is( $errors->[0]->message, 'This field must be a number' )
}

{
    my $errors = $form->errors( { name => 'string' } );

    is( @$errors, 1 );

    is( $errors->[0]->name, 'string' );
}

{
    my $errors = $form->errors( { type => 'Number' } );

    is( @$errors, 2 );

    is( $errors->[0]->name, 'bar' );
    is( $errors->[1]->name, 'string' );
}

{
    my $errors = $form->errors( {
            name => 'bar',
            type => 'Number',
        } );

    is( @$errors, 1 );

    is( $errors->[0]->name, 'bar' );
    is( $errors->[0]->type, 'Number' );
}
