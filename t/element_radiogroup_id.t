use strict;
use warnings;

use Test::More tests => 1;

use HTML::FormFu;
use lib 't/lib';
use HTMLFormFu::TestLib;

my $form = HTML::FormFu->new->id('form')->auto_id('%n%c');

my $foo = $form->element('radiogroup')->name('foo')->values( [ 1, 2 ] );

my $foo_xhtml = qq{<fieldset class="radiogroup">
<span>
<input name="foo" type="radio" value="1" id="foo1" />
<label for="foo1">1</label>
<input name="foo" type="radio" value="2" id="foo2" />
<label for="foo2">2</label>
</span>
</fieldset>};

is( "$foo", $foo_xhtml );

