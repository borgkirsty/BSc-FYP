# This import from future (theoretically) enables sphinx_autodoc_typehints to handle type aliases better
from __future__ import annotations  # pylint: disable=unused-variable

import enum
from typing import FrozenSet, List, Mapping, NamedTuple, Optional, Union


__all__ = [  # pylint: disable=unused-variable
    "Bundle",
    "IdentityKeyFormat",
    "Header",
    "JSONObject",
    "SecretType"
]


################
# Type Aliases #
################

# # Thanks @vanburgerberg - https://github.com/python/typing/issues/182
# if TYPE_CHECKING:
#     class JSONArray(list[JSONType], Protocol):  # type: ignore
#         __class__: Type[list[JSONType]]  # type: ignore
#
#     class JSONObject(dict[str, JSONType], Protocol):  # type: ignore
#         __class__: Type[dict[str, JSONType]]  # type: ignore
#
#     JSONType = Union[None, float, int, str, bool, JSONArray, JSONObject]

# Sadly @vanburgerberg's solution doesn't seem to like Dict[str, bool], thus for now an incomplete JSON
# type with finite levels of depth.
Primitives = Union[None, float, int, str, bool]
JSONType1 = Union[Primitives, List[Primitives], Mapping[str, Primitives]]
JSONType = Union[Primitives, List[JSONType1], Mapping[str, JSONType1]]
JSONObject = Mapping[str, JSONType]


############################
# Structures (NamedTuples) #
############################

class Bundle(NamedTuple):
    """
    The bundle is a collection of public keys and signatures used by the X3DH protocol to achieve asynchronous
    key agreements while providing forward secrecy and cryptographic deniability. Parties that want to be
    available for X3DH key agreements have to publish their bundle somehow. Other parties can then use that
    bundle to perform a key agreement.
    """

    identity_key: bytes
    signed_pre_key: bytes
    signed_pre_key_sig: bytes
    pre_keys: FrozenSet[bytes]


class Header(NamedTuple):
    """
    The header generated by the active party as part of the key agreement, and consumed by the passive party
    to derive the same shared secret.
    """

    identity_key: bytes
    ephemeral_key: bytes
    signed_pre_key: bytes
    pre_key: Optional[bytes]


################
# Enumerations #
################

@enum.unique
class IdentityKeyFormat(enum.Enum):
    """
    The two supported public key formats for the identity key:

    * Curve25519 public keys: 32 bytes, the little-endian encoding of the u coordinate as per `RFC 7748,
      section 5 "The X25519 and X448 Functions" <https://www.rfc-editor.org/rfc/rfc7748.html#section-5>`_.
    * Ed25519 public keys: 32 bytes, the little-endian encoding of the y coordinate with the sign bit of the x
      coordinate stored in the most significant bit as per `RFC 8032, section 3.2 "Keys"
      <https://www.rfc-editor.org/rfc/rfc8032.html#section-3.2>`_.
    """

    CURVE_25519: str = "CURVE_25519"
    ED_25519: str = "ED_25519"


@enum.unique
class SecretType(enum.Enum):
    """
    The two types of secrets that an :class:`IdentityKeyPair` can use internally: a seed or a private key.
    """

    SEED: str = "SEED"
    PRIV: str = "PRIV"