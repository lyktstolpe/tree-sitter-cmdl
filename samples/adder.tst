signal cout, u, v, w, x

cout, u, v, w, x <= Adder(0, 1, 0, 0,
                          1, 1, 1, 1)

# Component for adding two 4-bit numbers
component Adder(a, b, c, d,
                e, f, g, h)
                => cout, u, v, w, x
    signal ca, cb, cc # Intermediate carry signals

    # Output signals
    u, cout <= FullAdder(e, a, cc)
    v, cc   <= FullAdder(f, b, cb)
    w, cb   <= FullAdder(g, c, ca)
    x, ca   <= FullAdder(h, d, 0)

    # Helper component for adding two 1-bit numbers
    component FullAdder(a, b, cin) => s, cout
        signal z <= Xor(a, b)

        s <= Xor(z, cin)
        cout <= (z and cin) or (a and b)
    end
end

# Helper component performing exclusive or operation
component Xor(a, b) => x
    x <= a and not b or not a and b
end
