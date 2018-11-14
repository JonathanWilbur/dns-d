/**
    https://www.iana.org/assignments/dns-parameters/dns-parameters.xhtml
*/
module dns;
import std.array : appender, Appender;

private import std.exception : basicExceptionCtors;

///
public alias DNSException = DomainNameSystemException;
///
public
class DomainNameSystemException : Exception
{
    mixin basicExceptionCtors;
}

///
public alias DNSLabelException = DomainNameSystemLabelException;
///
public
class DomainNameSystemLabelException : DNSException
{
    mixin basicExceptionCtors;
}

///
public alias DNSLabelTooBigException = DomainNameSystemLabelTooBigException;
///
public
class DomainNameSystemLabelTooBigException : DNSLabelException
{
    mixin basicExceptionCtors;
}

///
public alias DNSLabelTooSmallException = DomainNameSystemLabelTooSmallException;
///
public
class DomainNameSystemLabelTooSmallException : DNSLabelException
{
    mixin basicExceptionCtors;
}

///
public alias DNSLabelInvalidException = DomainNameSystemLabelInvalidException;
///
public
class DomainNameSystemLabelInvalidException : DNSLabelException
{
    mixin basicExceptionCtors;
}

///
public alias DNSNameException = DomainNameSystemNameException;
///
public
class DomainNameSystemNameException : DNSException
{
    mixin basicExceptionCtors;
}

///
public alias DNSNameTooBigException = DomainNameSystemNameTooBigException;
///
public
class DomainNameSystemNameTooBigException : DNSNameException
{
    mixin basicExceptionCtors;
}

///
public alias DNSNameTooSmallException = DomainNameSystemNameTooSmallException;
///
public
class DomainNameSystemNameTooSmallException : DNSNameException
{
    mixin basicExceptionCtors;
}

///
public alias DNSNameInvalidException = DomainNameSystemNameInvalidException;
///
public
class DomainNameSystemNameInvalidException : DNSNameException
{
    mixin basicExceptionCtors;
}

///
public alias DNSOpCode = DomainNameSystemOpCode;
///
public 
enum DomainNameSystemOpCode : ubyte
{
    query = 0x00u,
    inverseQuery = 0x01u,
    status = 0x02u,
    reserved = 0x03u,
    notify = 0x04u,
    update = 0x05u,
    undefined6 = 0x06u,
    undefined7 = 0x07u,
    undefined8 = 0x08u,
    undefined9 = 0x09u,
    undefined10 = 0x0Au,
    undefined11 = 0x0Bu,
    undefined12 = 0x0Cu,
    undefined13 = 0x0Du,
    undefined14 = 0x0Eu,
    undefined15 = 0x0Fu
}

///
public alias DNSResponseCode = DomainNameSystemResponseCode;
///
public
enum DomainNameSystemResponseCode : ubyte
{
    noError = 0x00u,
    formatError = 0x01u,
    serverFailure = 0x02u,
    nameError = 0x03u,
    undefined4 = 0x04u,
    refused5 = 0x05u,
    nameExistsWhenItShouldNot = 0x06u,
    resourceRecordSetExistsWhenItShouldNot = 0x07u,
    resourceRecordSetDoesNotExistWhenItShould = 0x08u,
    notAuthoritative = 0x09u,
    notWithinZoneSpecifiedInQuery = 0x0A,
    reserved11 = 0x0Bu,
    reserved12 = 0x0Cu,
    reserved13 = 0x0Du,
    reserved14 = 0x0Eu,
    reserved15 = 0x0Fu
}

///
public alias DNSRecordType = DomainNameSystemRecordType;
///
public
enum DomainNameSystemRecordType : ushort
{
    a = 1u,
    aaaa = 28u,
    afsdb = 18u,
    apl = 42u,
    caa = 257u,
    cdnskey = 60u,
    cds = 59u,
    cert = 37u,
    cname = 5u,
    dhcid = 49u,
    dlv = 32769u,
    dname = 39u,
    dnskey = 48u,
    ds = 43u,
    hip = 55u,
    ipseckey = 45u,
    key = 25u,
    kx = 36u,
    loc = 29u,
    mx = 15u,
    naptr = 35u,
    ns = 2u,
    nsec = 47u,
    nsec3 = 50u,
    nsec3param = 51u,
    openpgpkey = 61u,
    ptr = 12u,
    rrsig = 46u,
    rp = 17u,
    sig = 24u,
    soa = 6u,
    srv = 33u,
    sshfp = 44u,
    ta = 32768u,
    tkey = 249u,
    tlsa = 52u,
    tsig = 250u,
    txt = 16u,
    uri = 256u,
    all = 255u,
    axfr = 252u,
    ixfr = 251u,
    opt = 41u,
    md = 3u,
    mf = 4u,
    maila = 254u,
    mb = 7u,
    mg = 8u,
    mr = 9u,
    minfo = 14u,
    mailb = 253u,
    wks = 11u,
    nb = 32u,
    nbstat = 33u,
    nill = 0u,
    a6 = 38u,
    nxt = 30u,
    hinfo = 13u,
    x25 = 19u,
    isdn = 20u,
    rt = 21u,
    nsap = 22u,
    nsapptr = 23u,
    px = 26u,
    eid = 31u,
    nimloc = 32u,
    atma = 34u,
    sink = 40u,
    gpos = 27u,
    uinfo = 100u,
    uid = 101u,
    gid = 102u,
    unspec = 103u,
    spf = 99u
}

///
public alias DNSClass = DomainNameSystemClass;
///
public
enum DomainNameSystemClass : ushort
{
    internet = 1u,
    unassigned = 2u,
    chaos = 3u,
    hesiod = 4u,
    none = 254u,
    any = 255u
}

///
public alias DNSQuestion = DomainNameSystemQuestion;
///
public
class DomainNameSystemQuestion
{
    public DNSName questionName;
    public DNSRecordType questionType;
    public DNSClass questionClass;
}

///
public alias DNSAnswer = DomainNameSystemAnswer;
///
public
class DomainNameSystemAnswer
{
    public DNSName answerName;
    public DNSRecordType answerType;
    public DNSClass answerClass;
    public uint timeToLive;
    public ubyte[] recordData;
}

///
public alias DNSPacket = DomainNameSystemPacket;
///
public
class DomainNameSystemPacket
{
    public ushort id = 0x0000u;
    public bool response = false;
    public DNSOpCode opCode = DNSOpCode.query;
    public bool authoritativeAnswer = false;
    public bool recursionDesired = false;
    public bool recursionAvailable = false;
    public bool reservedBit1 = false;
    public bool reservedBit2 = false;
    public bool reservedBit3 = false;
    public DNSResponseCode responseCode = DNSResponseCode.noError;
    public DNSQuestion[] questions;
    public DNSAnswer[] answers;
    public DNSAnswer[] authorities; // All must be NS records
    public ubyte[] additionalSpace;
}

///
public alias HostName = DomainNameSystemNameLabel;
///
public alias DNSLabel = DomainNameSystemNameLabel;
///
public
class DomainNameSystemNameLabel
{
    immutable public string value;

    public
    this(string value)
    {
        if (value.length == 0u)
            throw new DNSLabelTooSmallException
            (
                "This exception was thrown because you attempted to create " ~
                "a DNS label with zero characters, which is invalid."
            );

        if (value.length > 63u)
            throw new DNSLabelTooBigException
            (
                "This exception was thrown because you attempted to create " ~
                "a DNS label with greater than 63 characters, which is invalid."
            );

        if (value[0] == '-')
            throw new DNSLabelInvalidException
            (
                "This exception was thrown because you attempted to create " ~
                "a DNS label that started with a hyphen, which is invalid."
            );
        
        import std.ascii : isAlphaNum;
        foreach (character; value)
        {
            if (!character.isAlphaNum && character != '-')
                throw new DNSLabelInvalidException
                (
                    "This exception was thrown because you attempted to create " ~
                    "a DNS label containing a character that was not alphabetic, " ~
                    "numeric, or a hyphen, which would be invalid."
                );
        }

        this.value = value;
    }

    public @property @safe
    size_t length()
    {
        return (this.value.length + 1u); // Add 1 for the period-delimiter
    }

    override public @property @safe
    string toString() const
    {
        return this.value;
    }

    public @property
    ubyte[] toBytes() const
    {
        return ([cast(ubyte) this.value.length ] ~ cast(ubyte[]) this.value);
    }

    public override @system
    ubyte[] opCast(T = ubyte[])() const
    {
        this.toBytes();
    }
}

///
public alias DNSName = DomainNameSystemName;
///
public
class DomainNameSystemName
{
    immutable public DNSLabel[] labels;

    private @safe
    void validate(DNSLabel[] labels ...)
    {
        if (labels.length == 0u)
            throw new DNSNameTooSmallException
            (
                "This exception was thrown because you attempted to create " ~
                "a blank DNS name, which is invalid."
            );

        bool nonDigitFoundInTLD = false;

        import std.ascii : isDigit;
        foreach (character; labels[$-1].toString)
        {
            if (!character.isDigit)
            {
                nonDigitFoundInTLD = true;
            }
        }
        if (!nonDigitFoundInTLD)
            throw new DNSLabelInvalidException
            (
                "This exception was thrown because you tried to create a DNS " ~
                "label whose top-level-domain (TLD) consists entirely of " ~
                "numeric characters."
            );

        size_t length;
        foreach (label; labels)
        {
            length += label.length;
        }

        if (length > 253)
            throw new DNSNameTooBigException
            (
                "This exception was thrown because the DNS name exceeded 253 " ~
                "characters in length (after including the period-delimiters " ~
                "between labels), which is invalid for a DNS name."
            );
    }

    /**
        The constructor for a DNSName that takes DNS labels directly.

        The labels should be supplied in order of increasing authority, such as
        'www', 'google', 'com', instead of 'com', 'google', 'www'. In other words,
        the last DNSLabel should be the top-level-domain (TLD).
    */
    public
    this(DNSLabel[] labels ...)
    {
        validate(labels);
        this.labels = cast(immutable (DNSLabel[])) labels;
    }

    /**
        The constructor for a DNSName that takes the string representation of a FQDN.

        The labels should be supplied in order of increasing authority, such as
        'www.google.com.', instead of '.com.google.www'. In other words,
        the last DNSLabel should be the top-level-domain (TLD). The period at
        end, denoting the root zone, is not mandatory.
    */
    public
    this(string fqdn)
    {
        if (fqdn.length == 0u)
            throw new DNSNameTooSmallException
            (
                "This exception was thrown because you attempted to create " ~
                "a DNS name that is zero characters in length."
            );

        import std.array : split;
        string[] labelStrings = (fqdn[$-1] == '.' ? fqdn[0 .. $-1] : fqdn).split(".");
        Appender!(DNSLabel[]) labels = appender!(DNSLabel[])();
        foreach (ls; labelStrings)
        {
            labels.put(new DNSLabel(ls));
        }
        validate(labels.data); // REVIEW: This might flush the appender!
        this.labels = cast(immutable (DNSLabel[])) labels.data; // REVIEW: this might set labels to []!
    }

    override public @property
    string toString()
    {
        import std.array : appender, Appender;
        Appender!string ret = appender!string();
        foreach (label; this.labels)
        {
            ret.put(label.toString() ~ '.');
        }
        return ret.data;
    }

    @safe
    invariant
    {
        assert(this.labels.length > 0);
    }

}