/*
    json.js
    2007-06-11

    Public Domain

    This file adds these methods to JavaScript:

        array.toJSONString()
        boolean.toJSONString()
        date.toJSONString()
        number.toJSONString()
        object.toJSONString()
        string.toJSONString()
            These methods produce a JSON text from a JavaScript value.
            It must not contain any cyclical references. Illegal values
            will be excluded.

            The default conversion for dates is to an ISO string. You can
            add a toJSONString method to any date object to get a different
            representation.

        string.parseJSON(filter)
            This method parses a JSON text to produce an object or
            array. It can throw a SyntaxError exception.

            The optional filter parameter is a function which can filter and
            transform the results. It receives each of the keys and values, and
            its return value is used instead of the original value. If it
            returns what it received, then structure is not modified. If it
            returns undefined then the member is deleted.

            Example:

            // Parse the text. If a key contains the string 'date' then
            // convert the value to a date.

            myData = text.parseJSON(function (key, value) {
                return key.indexOf('date') >= 0 ? new Date(value) : value;
            });

    It is expected that these methods will formally become part of the
    JavaScript Programming Language in the Fourth Edition of the
    ECMAScript standard in 2008.

    This file will break programs with improper for..in loops. See
    http://yuiblog.com/blog/2006/09/26/for-in-intrigue/

    This is a reference implementation. You are free to copy, modify, or
    redistribute.

    Use your own copy. It is extremely unwise to load untrusted third party
    code into your pages.
*/

/*jslint evil: true */

// Augment the basic prototypes if they have not already been augmented.

if (!Object.prototype.toJSONString) {

    Object.defineProperty(Array.prototype, 'toJSONString', {
        enumerable: false,
        value: function () {
            let a = [],     // The array holding the member texts.
                i,          // Loop counter.
                l = this.length,
                v;          // The value to be stringified.


// For each value in this array...

            for (i = 0; i < l; i += 1) {
                v = this[i];
                switch (typeof v) {
                case 'object':

// Serialize a JavaScript object value. Ignore objects thats lack the
// toJSONString method. Due to a specification error in ECMAScript,
// typeof null is 'object', so watch out for that case.

                    if (v) {
                        if (typeof v.toJSONString === 'function') {
                            a.push(v.toJSONString());
                        }
                    } else {
                        a.push('null');
                    }
                    break;

                case 'string':
                case 'number':
                case 'boolean':
                    a.push(v.toJSONString());

// Values without a JSON representation are ignored.

                }
            }

// Join all of the member texts together and wrap them in brackets.

            return '[' + a.join(',') + ']';
        },
    });

    Object.defineProperty(Boolean.prototype, 'toJSONString', {
        enumerable: false,
        value: function () {
            return String(this);
        },
    });

    Object.defineProperty(Date.prototype, 'toJSONString', {
        enumerable: false,
        value: function () {

// Ultimately, this method will be equivalent to the date.toISOString method.

            function f(n) {

// Format integers to have at least two digits.

                return n < 10 ? '0' + n : n;
            }

            return '"' + this.getFullYear() + '-' +
                    f(this.getMonth() + 1) + '-' +
                    f(this.getDate()) + 'T' +
                    f(this.getHours()) + ':' +
                    f(this.getMinutes()) + ':' +
                    f(this.getSeconds()) + '"';
        },
    });

    Object.defineProperty(Number.prototype, 'toJSONString', {
        enumerable: false,
        value: function () {

// JSON numbers must be finite. Encode non-finite numbers as null.

            return isFinite(this) ? String(this) : 'null';
        },
    });

    Object.defineProperty(Object.prototype, 'toJSONString', {
        enumerable: false,
        value: function () {
            let a = [],     // The array holding the member texts.
                k,          // The current key.
                v;          // The current value.

// Iterate through all of the keys in the object, ignoring the proto chain.

            for (k in this) {
                if (this.hasOwnProperty(k)) {
                    v = this[k];
                    switch (typeof v) {
                    case 'object':

// Serialize a JavaScript object value. Ignore objects that lack the
// toJSONString method. Due to a specification error in ECMAScript,
// typeof null is 'object', so watch out for that case.

                        if (v) {
                            if (typeof v.toJSONString === 'function') {
                                a.push(k.toJSONString() + ':' + v.toJSONString());
                            }
                        } else {
                            a.push(k.toJSONString() + ':null');
                        }
                        break;

                    case 'string':
                    case 'number':
                    case 'boolean':
                        a.push(k.toJSONString() + ':' + v.toJSONString());

// Values without a JSON representation are ignored.

                    }
                }
            }

// Join all of the member texts together and wrap them in braces.

            return '{' + a.join(',') + '}';
        }
    });

// m is a table of character substitutions.

    const m = {
        '\b': '\\b',
        '\t': '\\t',
        '\n': '\\n',
        '\f': '\\f',
        '\r': '\\r',
        '"' : '\\"',
        '\\': '\\\\'
    };

    Object.defineProperty(String.prototype, 'parseJSON', {
        enumerable: false,
        value: function (filter) {
            let j;

            function walk(k, v) {
                let i;
                if (v && typeof v === 'object') {
                    for (i in v) {
                        if (v.hasOwnProperty(i)) {
                            v[i] = walk(i, v[i]);
                        }
                    }
                }
                return filter(k, v);
            }


// Parsing happens in three stages. In the first stage, we run the text against
// a regular expression which looks for non-JSON characters. We are especially
// concerned with '()' and 'new' because they can cause invocation, and '='
// because it can cause mutation. But just to be safe, we will reject all
// unexpected characters.

            if (/^("(\\.|[^"\\\n\r])*?"|[,:{}\[\]0-9.\-+Eaeflnr-u \n\r\t])+?$/.
                    test(this)) {

// In the second stage we use the eval function to compile the text into a
// JavaScript structure. The '{' operator is subject to a syntactic ambiguity
// in JavaScript: it can begin a block or an object literal. We wrap the text
// in parens to eliminate the ambiguity.

                try {
                    j = eval('(' + this + ')');
                } catch (e) {
                    throw new SyntaxError('parseJSON');
                }
            } else {
                throw new SyntaxError('parseJSON');
            }

// In the optional third stage, we recursively walk the new structure, passing
// each name/value pair to a filter function for possible transformation.

            if (typeof filter === 'function') {
                j = walk('', j);
            }
            return j;
        },
    });

    Object.defineProperty(String.prototype, 'toJSONString', {
        enumerable: false,
        value: function () {
// If the string contains no control characters, no quote characters, and no
// backslash characters, then we can simply slap some quotes around it.
// Otherwise we must also replace the offending characters with safe
// sequences.

            if (/["\\\x00-\x1f]/.test(this)) {
                return '"' + this.replace(/([\x00-\x1f\\"])/g, function (a, b) {
                    let c = m[b];
                    if (c) {
                        return c;
                    }
                    c = b.charCodeAt();
                    return '\\u00' +
                        Math.floor(c / 16).toString(16) +
                        (c % 16).toString(16);
                }) + '"';
            }
            return '"' + this + '"';
        },
    });
}
